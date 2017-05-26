/**
 * Clase que modela l codificacion del 
 * Fenotipo y Genotipo del algorimo genetio
 * Author:
 *    Jonathan Barragan <jonathan.barragan.j@ciencias.unam.mx>
 */

namespace CuboGenetico{
	public class FenoGeno : GLib.Object{
		//semilla
		private GLib.Rand rand;
		
		public FenoGeno(int semilla){
			this.rand = new GLib.Rand();
			this.rand.set_seed(semilla);
		}
		
		/**
		 *Codifica el fenotipo en un genotipo
		 */
		public AGenetico.Genotipo codifica(AGenetico.Fenotipo feno){
			var geno = new AGenetico.Genotipo(feno.fenotipo.length);
			for(int i =0;i<feno.fenotipo.length;i++){
				 geno.genotipo[i]=this.co(feno.fenotipo[i]);
			}
			return geno;
		}

		/**
		 *Decodifica el genotipo en un fenotipo
		 */
		public AGenetico.Fenotipo decodifica(AGenetico.Genotipo geno){
			var feno =  new AGenetico.Fenotipo(geno.genotipo.length);
			for(int i =0;i<geno.genotipo.length;i++){
				feno.fenotipo[i] = this.dc(geno.genotipo[i]);
			}
			return feno;
		}

		/**
		 *Crea y regresa un nuevo genotipo de tamanio n 
		 *con valores aleatorios
		 */
		public AGenetico.Genotipo genoAleatNuev(int n){
			var geno = new AGenetico.Genotipo(n);
			for(int i =0;i<n;i++){
				geno.genotipo[i] = (int)this.rand.int_range(1,13);
			}
			return geno;
		}

		/**
		 * R=1 ,L=3 ,U=5 ,D=7 ,F=9  ,B =11 
		 * R'=2,L'=4,U'=6,D'=8,F'=10,B'=12
		 */
		private string dc(int i){
			string g = "";
			switch (i) {
			case 1:
				g ="R";
				break;
			case 2:
				g = "R'";
				break;
			case 3:
				g = "L";
				break;
			case 4:
				g = "L'";
				break;
			case 5:
				g = "U";
				break;
			case 6:
			    g = "U'";
				break;
			case 7:
				g = "D";
				break;
			case 8:
				g = "D'";
				break;
			case 9:
				g = "F";
				break;
			case 10:
				g = "F'";
				break;
			case 11:
				g = "B";
				break;
			case 12:
				g = "B'";
				break;
			}
			return g;
		}

		/**
		 * R=1 ,L=3 ,U=5 ,D=7 ,F=9  ,B =11 
		 * R'=2,L'=4,U'=6,D'=8,F'=10,B'=12
		 */
		private int co(string i){
			int f =0;
			switch (i) {
			case "R":
				f = 1;
				break;
			case "R'":
				f = 2;
				break;
			case "L":
				f = 3;
				break;
			case "L'":
				f = 4;
				break;
			case "U":
				f = 5;
				break;
			case "U'":
			    f = 6;
				break;
			case "D":
				f = 7;
				break;
			case "D'":
				f = 8;
				break;
			case "F":
				f = 9;
				break;
			case "F'":
				f = 10;
				break;
			case "B":
				f = 11;
				break;
			case "B'":
				f = 12;
				break;
			}
			return f;
		}
	}
}
