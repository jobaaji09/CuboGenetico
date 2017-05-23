namespace CuboGenetico{
    class Main : GLib.Object {

		public static int main(string[] args){
			var cu = new int[6,9];
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
			var c = new Cubo.Cubo3x3(cu);
		    //c.r();
		    c.u();
			
			c.dibuja();
			return 0;
		}

		

	}
}
