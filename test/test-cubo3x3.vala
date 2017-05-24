namespace CuboGenetico.Test{
    /**
     * Test cases for {@link Cubo3x3}.
     */
    public class TestCubo3x3 : CuboGenetico.Test.TestCase{
		private Cubo.Cubo3x3 c;
		private int[,] cu;
		
        public TestCubo3x3(){
            base("TestCubo3x3");
            add_test("test_rrpuup",test_rrpuup);
			add_test("test_llpddp",test_llpddp);
			this.cu = new int[6,9];
			for(int i=0;i<6;i++){
				for(int j=0;j<9;j++){
					if(i<3){
						if(j<3){
							cu[i,j] =0; 
						}else if(j<6){
							cu[i,j] =1;
						}else if(j<9){
							cu[i,j] =2;
						}
					}else if(i<6){
						if(j<3){
							cu[i,j] =3; 
						}else if(j<6){
							cu[i,j] =4;
						}else if(j<9){
							cu[i,j] =5;
						}
					
					}
				}
			}
			this.c = new Cubo.Cubo3x3(this.cu);
        }
        
        public  void test_rrpuup () {
			
			int[] g = {1,5,2,6,1,5,2,6,1,5,2,6,1,5,2,6,1,5,2,6,1,5,2,6};
			this.c.giraCaras(g);
			var act = this.c.getActual();
			for(int i =0;i<6;i++){
				for(int j=0;j<9;j++){
					assert(act[i,j]==this.cu[i,j]);
				}
			}
			this.c.reset();
			
		}

		public void test_llpddp(){
			
			int[] g ={3,7,4,8,3,7,4,8,3,7,4,8,3,7,4,8,3,7,4,8,3,7,4,8};
			c.giraCaras(g);
			var act = this.c.getActual();
			for(int i =0;i<6;i++){
				for(int j=0;j<9;j++){
					assert(act[i,j]==this.cu[i,j]);
				}
			}
			this.c.reset();
			
		}
		
        
    }
}
