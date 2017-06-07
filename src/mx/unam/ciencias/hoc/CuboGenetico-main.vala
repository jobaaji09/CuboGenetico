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
				/*
				var fenogeno = new FenoGeno(1);
				var g = fenogeno.genoAleatNuev(10);
				var f = fenogeno.decodifica(g);
				stdout.printf("%s",f.to_string());
				cubo.giraCaras(f.fenotipo);
				stdout.printf("%s",cubo.to_string());
				*/
				cubo.dibuja("entrada");
				/*
				var ffitness = new FFitness(cubo);
				var fenogeno = new FenoGeno(2);
				var corrector = new Corrector(2);
				var storneo = new  STorneo(1);
				var cruza = new CruzaUP(1,0.9);
				var mutacion = new Mutacion(1 , 0.1);
				var cubogene = new CuboGenetico(ffitness,
												fenogeno,
												corrector,
												storneo,
												cruza,
												mutacion,
												1,
												20);
				cubogene.run();
				var mg = cubogene.mejor;
				stdout.printf("Mejor de la generacion :\n%s",mg.to_string());
				cubo.giraCaras(mg.fenotipo.fenotipo);
				cubo.dibuja(mg.fitness.to_string());
				*/
			   
				
				for(int i =0; i<200;i++){
					
					var rand = new GLib.Rand();
					rand.set_seed(i);

					int fg = (int)rand.int_range(0,200);
					int st = (int)rand.int_range (0,200);
					int cr = (int)rand.int_range (0,200);
					int mt = (int)rand.int_range (0,200);
					int cd = (int)rand.int_range (0,200);
					int co = (int)rand.int_range (0,200);
					
					var ffitness = new FFitness(cubo);
					var fenogeno = new FenoGeno(fg);
					var corrector = new Corrector(st);
					var storneo = new  STorneo(cr);
					var cruza = new CruzaUP(co,0.9);
					var mutacion = new Mutacion(mt , 0.1);
					var cubogene = new CuboGenetico(ffitness,
													fenogeno,
													corrector,
													storneo,
													cruza,
													mutacion,
													cd,
													40);
					cubogene.run();
					var mg = cubogene.mejor;
					stdout.printf("Mejor de la generacion :\n%s",mg.to_string());
					stdout.printf("sm: %d\n",i);
					//cubo.giraCaras(mg.fenotipo.fenotipo);
					//cubo.dibuja(i.to_string());
					//cubo.reset();
				}
			}else{
				stdout.printf("Falta el archov de entrada\n");
			}
			
			return 0;
		}

		

	}
}
