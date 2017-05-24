 
namespace CuboGenetico.Test{
    
    public class TestCuboGeneticoMain {
        
        
        public static int main (string[] args) {
            GLib.Test.init(ref args);
            GLib.TestSuite.get_root().add_suite(
				new TestCubo3x3().get_suite());
            return GLib.Test.run();
        }
        
    }
}
