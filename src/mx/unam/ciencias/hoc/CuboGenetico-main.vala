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
			
			if(args.length >=2){
				var c = archivo(args[1]);
				var cubo = new AGenetico.Cubo3x3(c);
				//cubo.dibuja(1.0);
				var ffitness = new FFitness(cubo);
				var fenogeno = new FenoGeno(9);
				var criador = new Criador(fenogeno,ffitness,1);
				var poblacion  = criador.poblacionNuevaR(10);
				for(int i=0;i<poblacion.getTam();i++){
					stdout.printf("%s\n",poblacion.getIndividuo(i).to_string());
				}
			}else{
				stdout.printf("Falta el archov de entrada\n");
			}
			
			return 0;
		}

		

	}
}
