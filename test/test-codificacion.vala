namespace CuboGenetico.Test{
    /**
     * Test cases for {@link Cubo3x3}.
     */
    public class TestCodificacion : CuboGenetico.Test.TestCase{
		private Codificacion.FenoGeno c;
		
        public TestCodificacion(){
            base("TestCodificacion");
            add_test("test_coDecoR",test_coDecoR);
			add_test("test_coDecoR",test_coDeco);
			this.c = new Codificacion.FenoGeno(9);
        }
        
        public  void test_coDecoR() {
			var g = c.genoAleatNuev(10);
			var f = c.decodifica(g);
			var gprima = c.codifica(f);
			for(int i =0;i<g.length;i++){
				assert(gprima[i]==g[i]);
			}
		}

		public  void test_coDeco() {
			int[] pr1 ={1,5,2,5,1,5,5,2};
			string[] pr2 = {"R","U","R'","U","R","U","U","R'"};
			var f = c.decodifica(pr1);
			for(int i =0;i<pr1.length;i++){
				assert(f[i]==pr2[i]);
			}
			var g = c.codifica(pr2);
			for(int i =0;i<pr2.length;i++){
				assert(g[i]==pr1[i]);
			}
		}
        
    }
}
