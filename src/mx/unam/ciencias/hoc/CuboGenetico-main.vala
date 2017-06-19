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
				var g = fenogeno.genoAleatNuev(200);
				var f = fenogeno.decodifica(g);
				stdout.printf("%s",f.to_string());
				cubo.giraCaras(f.fenotipo);
				stdout.printf("%s",cubo.to_string());
				*/
				cubo.dibuja("entrada");
				/*
				var ffitness = new FFitness(cubo);
				var fenogeno = new FenoGeno(3);
				var corrector = new Corrector(3);
				var storneo = new  STorneo(3);
				var cruza = new CruzaUP(3,0.9);
				var mutacion = new Mutacion(3 , 0.1);
				var cubogene = new CuboGenetico(ffitness,
												fenogeno,
												corrector,
												storneo,
												cruza,
												mutacion,
												3,
												40);
				cubogene.run();
				var mg = cubogene.mejor;
				stdout.printf("Mejor de la generacion :\n%s",mg.to_string());
				cubo.giraCaras(mg.fenotipo.fenotipo);
				cubo.dibuja(mg.fitness.to_string());
				
				*/
				
				Individuo msemilla = null;
				int sm =0;
				for(int i =0; i<20;i++){
					
					var rand = new GLib.Rand();
					rand.set_seed(i);
					
					var ffitness = new FFitness(cubo);
					var fenogeno = new FenoGeno(i);
					var corrector = new Corrector(i);
					var storneo = new  STorneo(i);
					var cruza = new CruzaUP(i,0.9);
					var mutacion = new Mutacion(i , 0.1);
					var cubogene = new CuboGenetico(ffitness,
													fenogeno,
													corrector,
													storneo,
													cruza,
													mutacion,
													i,
													40);
					cubogene.run();
					
					if(msemilla ==null){
						msemilla =  cubogene.mejor;
					}else if(msemilla.fitness >=  cubogene.mejor.fitness){
						sm =i;
						msemilla = cubogene.mejor;
					}
					stdout.printf("%d\n",i);
					stdout.printf("%s\n",cubogene.mejor.to_string());

					//cubo.giraCaras(cubogene.mejor.fenotipo.fenotipo);
					//cubo.dibuja(i.to_string());
					//cubo.reset();
				}

				stdout.printf("Mejor \n%d\n",sm);
				stdout.printf("%s\n",msemilla.to_string());
				cubo.giraCaras(msemilla.fenotipo.fenotipo);
				cubo.dibuja(sm.to_string());
				cubo.reset();
			}else{
				stdout.printf("Falta el archov de entrada\n");
			}
			
			return 0;
		}

		

	}
}
