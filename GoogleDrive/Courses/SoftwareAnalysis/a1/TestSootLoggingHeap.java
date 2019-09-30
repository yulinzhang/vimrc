
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import soot.*;
import soot.jimple.AssignStmt;
import soot.jimple.FieldRef;
import soot.jimple.InstanceFieldRef;
import soot.jimple.StaticFieldRef;
import soot.jimple.Stmt;
import soot.options.Options;
import soot.tagkit.LineNumberTag;

public class TestSootLoggingHeap extends BodyTransformer {

    private static SootMethodRef logFieldAccMethod;

    public static void main(String[] args) {

        String mainclass = "HelloThread";

        //output Jimple
        //Options.v().set_output_format(1);
//		//set classpath
        String javapath = System.getProperty("java.class.path");
        String jredir = System.getProperty("java.home") + "/lib/rt.jar";
        String path = javapath + File.pathSeparator + jredir;
        Scene.v().setSootClassPath(path);

        //add an intra-procedural analysis phase to Soot
        TestSootLoggingHeap analysis = new TestSootLoggingHeap();
        PackManager.v().getPack("jtp").add(new Transform("jtp.TestSootLoggingHeap", analysis));

        //load and set main class
        Options.v().set_app(true);
        Options.v().keep_line_number();

        SootClass appclass = Scene.v().loadClassAndSupport(mainclass);
        Scene.v().setMainClass(appclass);
        SootClass logClass = Scene.v().loadClassAndSupport("Log");
        logFieldAccMethod = logClass.getMethod("void logFieldAcc(java.lang.Object,java.lang.String,boolean,boolean)").makeRef();
        Scene.v().loadNecessaryClasses();

        //start working
        PackManager.v().runPacks();

        PackManager.v().writeOutput();
    }

    @Override
    protected void internalTransform(Body b, String phaseName,
            Map<String, String> options) {
        //fixLineNumber(b);
        //we don't instrument Log class
        if (!b.getMethod().getDeclaringClass().getName().equals("Log")) {
            Iterator<Unit> it = b.getUnits().snapshotIterator();
            while (it.hasNext()) {
                Unit unit = it.next();
                Stmt stmt = (Stmt) unit;
                if (stmt.containsFieldRef()) {
                    //System.out.println(stmt);
                    FieldRef fref = stmt.getFieldRef();
                    String field = fref.getField().getSignature();
                    String object = "unknown";
                    if (unit.hasTag("LineNumberTag")) {
                        LineNumberTag tag = (LineNumberTag) unit.getTag(("LineNumberTag"));
                        //System.out.println("line num:" + tag.getLineNumber());
                    }
                    boolean write_or_not = true;
                    if (stmt instanceof AssignStmt) {
                        AssignStmt assign_stmt = (AssignStmt) stmt;
                        Value left_op = assign_stmt.getLeftOp();
                        Value right_op = assign_stmt.getRightOp();

                        boolean instance_field = left_op instanceof InstanceFieldRef;
                        boolean static_field = left_op instanceof StaticFieldRef;
                        if (instance_field || static_field) {
                            write_or_not = true;
                            if (instance_field) {
                                List<ValueBox> boxes=left_op.getUseBoxes();
                                object = boxes.get(0).getValue().toString();
                                //System.out.println(boxes.size());
                                
                            }
                        } else {
                            write_or_not = false;
                            //read
                            if (right_op instanceof InstanceFieldRef) {
                                object = right_op.getUseBoxes().get(0).getValue().toString();
                            }
                        }
                    }
                    

                    if (fref instanceof InstanceFieldRef) {
                        Log.logFieldAcc(object, field, false, write_or_not);

                        InstanceFieldRef i_fref = (InstanceFieldRef) fref;
                        if (stmt instanceof AssignStmt) {
                            AssignStmt assign_stmt = (AssignStmt) stmt;
                        }

                    } else if (fref instanceof StaticFieldRef) {
                        Log.logFieldAcc(object, field, true, write_or_not);

                    }

                }

            }
        }
    }
}
