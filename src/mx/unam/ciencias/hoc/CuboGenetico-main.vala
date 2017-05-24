namespace CuboGenetico{
    class Main : GLib.Object {

		/**
		 * recibe el nombre de el archivo donde esta la entrada del programa
		 */
		public static void archivo(string arc){
			var file = File.new_for_path (arc);
			if (!file.query_exists ()) {
				stderr.printf ("File '%s' doesn't exist.\n", file.get_path ());
				
			}
			
			try {
				// Open file for reading and wrap returned FileInputStream into a
				// DataInputStream, so we can read line by line
				var dis = new DataInputStream (file.read ());
				string line;
				// Read lines until end of file (null) is reached
				while ((line = dis.read_line (null)) != null) {
					stdout.printf ("%s\n", line);
				}
			} catch (Error e) {
				error ("%s", e.message);
			}
			
		}
		
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
			archivo(args[1]);
			var c = new Cubo.Cubo3x3(cu);
		    int[] g ={1,1,3,3,5,5,7,7,9,9,11,11};
			c.giraCaras(g);
			c.reset();
			c.dibuja();
			return 0;
		}

		

	}
}
