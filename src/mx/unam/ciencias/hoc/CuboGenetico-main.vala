namespace CuboGenetico{
    class Main : GLib.Object {

		/**
		 * recibe el nombre de el archivo donde esta la entrada del programa
		 */
		public static int[,] archivo(string arc){
			var cubo = new int[6,9];
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
				int j =0;
				while ((line = dis.read_line (null)) != null) {
					string[] s = line.split(",");
					if(s.length == 9){
						for(int i =0;i<9;i++){
							cubo[j,i] = int.parse(s[i]);
						}
						j++;
					}else{
						stdout.printf ("%s\n", line);
					}
				}
			} catch (Error e) {
				error ("%s", e.message);
			}
			return cubo;
		}
		
		public static int main(string[] args){		
			Cubo.Cubo3x3 cubo = null;
			if(args.length >=2){
				var c = archivo(args[1]);
				cubo = new Cubo.Cubo3x3(c);
			}
			var fg = new Codificacion.FenoGeno(1);
			var g = fg.genoAleatNuev(10);
			var gf = fg.decodifica(g);
			foreach(string i in gf){
				stdout.printf("%s,",i);
			}
			stdout.printf("\n");
			var f = new FFitness(cubo);
			
			double fd = f.evaluacion(g);
			stdout.printf("evaluacion = %2.9f\n",fd);
		    
			cubo.dibuja();
			
			return 0;
		}

		

	}
}
