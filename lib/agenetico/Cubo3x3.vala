/**
 * Clase que representa un cubo magico de 3x3x3
 * Author:
 *    Jonathan Barragan <jonathan.barragan.j@ciencias.unam.mx>
 */
namespace CuboGenetico.AGenetico{
    public class Cubo3x3 : GLib.Object{
		
		private int[,] inicial;
		private int[,] actual;
        /**
         * Constructor para un Cubo 3x3x3.
         */
		
		public Cubo3x3(int[,] cubo){
			this.inicial =cubo;
			this.actual = new int[6,9];
		    for(int i=0;i<6;i++){
				for(int j=0;j<9;j++){
					this.actual[i,j] = cubo[i,j];
				}
			}
			
		}
		/**
		 *Regresa el estado actual del cubo
		 */
		public int[,] getActual(){
			return this.actual;
		}

		/**
		 * regresa el cubo al estado inicial
		 */
		public void reset(){
			for(int i =0;i<6;i++){
				for(int j=0;j<9;j++){
					this.actual[i,j] = this.inicial[i,j];
				}
			}
		}
		/**
		 *Giramos mas de una cara dado la lista de giros
		 */
		public void giraCaras(string[] giros){
			foreach(string i in giros){
				this.giraCara(i);
			}
		}
		/**
		 * Gira una cara del cubo dado i
		 * R=1 ,L=3 ,U=5 ,D=7 ,F=9  ,B =11 
		 * R'=2,L'=4,U'=6,D'=8,F'=10,B'=12
		 */
		public void giraCara(string i){
			switch (i) {
			case "R":
				this.r();
				break;
			case "R'":
				this.rprima();
				break;
			case "L":
				this.l();
				break;
			case "L'":
				this.lprima();
				break;
			case "U":
				this.u();
				break;
			case "U'":
				this.uprima();
				break;

			case "D":
				this.d();
				break;
			case "D'":
				this.dprima();
				break;
			case "F":
				this.f();
				break;
			case "F'":
				this.fprima();
				break;
			case "B":
				this.b();
				break;
			case "B'":
				this.bprima();
				break;
			}
		}

		/**
		 *Gira la cara derecha 90 grados sentido horario
		 */
		private void r(){
			int i = this.actual[0,2];
			int j = this.actual[1,2];
			int k = this.actual[2,2];
			this.actual[0,2] = this.actual[3,2];
			this.actual[1,2] = this.actual[4,2];
			this.actual[2,2] = this.actual[5,2];

			int l = this.actual[0,8];
			int m = this.actual[1,8];
			int n = this.actual[2,8];
			this.actual[0,8] = i;
			this.actual[1,8] = j;
			this.actual[2,8] = k;

			this.actual[3,2] = this.actual[5,6];
			this.actual[4,2] = this.actual[4,6]; 
			this.actual[5,2] = this.actual[3,6];

			this.actual[3,6] = n;
			this.actual[4,6] = m; 
			this.actual[5,6] = l;

			i = this.actual[0,3];
			this.actual[0,3] = this.actual[2,3];
			this.actual[2,3] =this.actual[2,5];
			this.actual[2,5] = this.actual[0,5];
			this.actual[0,5] = i;

			i = this.actual[0,4];
			this.actual[0,4] = this.actual[1,3];
			this.actual[1,3] = this.actual[2,4];
			this.actual[2,4] = this.actual[1,5];
			this.actual[1,5] = i;
			
		}

		/**
		 * Gira la cara derecha 90 grados sentido antihorario
		 */
		private void rprima(){
			int i = this.actual[0,2];
			int j = this.actual[1,2];
			int k = this.actual[2,2];
			this.actual[0,2] = this.actual[0,8];
			this.actual[1,2] = this.actual[1,8];
			this.actual[2,2] = this.actual[2,8];

			int l = this.actual[3,2];
			int m = this.actual[4,2];
			int n = this.actual[5,2];
			this.actual[0,8] = this.actual[5,6];
			this.actual[1,8] = this.actual[4,6];
			this.actual[2,8] = this.actual[3,6];

			this.actual[3,2] = i;
			this.actual[4,2] = j; 
			this.actual[5,2] = k;

			this.actual[3,6] = n;
			this.actual[4,6] = m; 
			this.actual[5,6] = l;

			i = this.actual[0,3];
			this.actual[0,3] = this.actual[0,5];
			this.actual[0,5] =this.actual[2,5];
			this.actual[2,5] = this.actual[2,3];
			this.actual[2,3] = i;

			i = this.actual[0,4];
			this.actual[0,4] = this.actual[1,5];
			this.actual[1,5] = this.actual[2,4];
			this.actual[2,4] = this.actual[1,3];
			this.actual[1,3] = i;
			
		}

		/**
		 * Gira la cara izquierda 90 grados sentido horario
		 */
		private void l(){
			int i = this.actual[0,0];
			int j = this.actual[1,0];
			int k = this.actual[2,0];
			this.actual[0,0] = this.actual[0,6];
			this.actual[1,0] = this.actual[1,6];
			this.actual[2,0] = this.actual[2,6];

			int l = this.actual[3,0];
			int m = this.actual[4,0];
			int n = this.actual[5,0];
			this.actual[0,6] = this.actual[5,8];
			this.actual[1,6] = this.actual[4,8];
			this.actual[2,6] = this.actual[3,8];

			this.actual[3,0] = i;
			this.actual[4,0] = j; 
			this.actual[5,0] = k;

			this.actual[3,8] = n;
			this.actual[4,8] = m; 
			this.actual[5,8] = l;

			i = this.actual[3,3];
			this.actual[3,3] = this.actual[5,3];
			this.actual[5,3] =this.actual[5,5];
			this.actual[5,5] = this.actual[3,5];
			this.actual[3,5] = i;

			i = this.actual[3,4];
			this.actual[3,4] = this.actual[4,3];
			this.actual[4,3] = this.actual[5,4];
			this.actual[5,4] = this.actual[4,5];
			this.actual[4,5] = i;
				
			
		}

		/**
		 * Gira la cara izquierda 90 grados sentido antihorario
		 */
		private void lprima(){
			int i = this.actual[0,0];
			int j = this.actual[1,0];
			int k = this.actual[2,0];
			this.actual[0,0] = this.actual[3,0];
			this.actual[1,0] = this.actual[4,0];
			this.actual[2,0] = this.actual[5,0];

			int l = this.actual[0,6];
			int m = this.actual[1,6];
			int n = this.actual[2,6];
			this.actual[0,6] = i;
			this.actual[1,6] = j;
			this.actual[2,6] = k;

			this.actual[3,0] = this.actual[5,8];
			this.actual[4,0] = this.actual[4,8]; 
			this.actual[5,0] = this.actual[3,8];

			this.actual[5,8] = l;
			this.actual[4,8] = m; 
			this.actual[3,8] = n;
			
			i = this.actual[3,3];
			this.actual[3,3] = this.actual[3,5];
			this.actual[3,5] =this.actual[5,5];
			this.actual[5,5] = this.actual[5,3];
			this.actual[5,3] = i;

			i = this.actual[3,4];
			this.actual[3,4] = this.actual[4,5];
			this.actual[4,5] = this.actual[5,4];
			this.actual[5,4] = this.actual[4,3];
			this.actual[4,3] = i;
		}

		/**
		 * Gira la cara superior 90 grados sentido horario
		 */
		private void u(){
			int i = this.actual[0,0];
			int j = this.actual[0,1];
			int k = this.actual[0,2];
			this.actual[0,0] = this.actual[0,3];
			this.actual[0,1] = this.actual[0,4];
			this.actual[0,2] = this.actual[0,5];

			int l = this.actual[3,3];
			int m = this.actual[3,4];
			int n = this.actual[3,5];
			this.actual[0,3] = this.actual[3,6];
			this.actual[0,4] = this.actual[3,7];
			this.actual[0,5] = this.actual[3,8];

			this.actual[3,3] = i;
			this.actual[3,4] = j; 
			this.actual[3,5] = k;

			this.actual[3,6] = l;
			this.actual[3,7] = m; 
			this.actual[3,8] = n;
			
			i = this.actual[0,6];
			this.actual[0,6] = this.actual[2,6];
			this.actual[2,6] =this.actual[2,8];
			this.actual[2,8] = this.actual[0,8];
			this.actual[0,8] = i;

			i = this.actual[0,7];
			this.actual[0,7] = this.actual[1,6];
			this.actual[1,6] = this.actual[2,7];
			this.actual[2,7] = this.actual[1,8];
			this.actual[1,8] = i;
		}
		/**
		 * Gira la cara superior 90 grados sentido antihorario
		 */
		private void uprima(){
			int i = this.actual[0,0];
			int j = this.actual[0,1];
			int k = this.actual[0,2];
			this.actual[0,0] = this.actual[3,3];
			this.actual[0,1] = this.actual[3,4];
			this.actual[0,2] = this.actual[3,5];

			int l = this.actual[0,3];
			int m = this.actual[0,4];
			int n = this.actual[0,5];
			this.actual[0,3] = i;
			this.actual[0,4] = j;
			this.actual[0,5] = k;

			this.actual[3,3] = this.actual[3,6];
			this.actual[3,4] = this.actual[3,7]; 
			this.actual[3,5] = this.actual[3,8];

			this.actual[3,6] = l;
			this.actual[3,7] = m; 
			this.actual[3,8] = n;

			i = this.actual[0,6];
			this.actual[0,6] = this.actual[0,8];
			this.actual[0,8] =this.actual[2,8];
			this.actual[2,8] = this.actual[2,6];
			this.actual[2,6] = i;

			i = this.actual[0,7];
			this.actual[0,7] = this.actual[1,8];
			this.actual[1,8] = this.actual[2,7];
			this.actual[2,7] = this.actual[1,6];
			this.actual[1,6] = i;
			
		}

		/**
		 * Gira la cara frontal 90 grados sentido horario
		 */
		private void f(){
			int i = this.actual[0,3];
			int j = this.actual[1,3];
			int k = this.actual[2,3];
			this.actual[0,3] = this.actual[2,6];
			this.actual[1,3] = this.actual[2,7];
			this.actual[2,3] = this.actual[2,8];

			int l = this.actual[3,0];
			int m = this.actual[3,1];
			int n = this.actual[3,2];
			this.actual[2,6] = this.actual[5,5];
			this.actual[2,7] = this.actual[4,5];
			this.actual[2,8] = this.actual[3,5];

			this.actual[3,0] = k;
			this.actual[3,1] = j; 
			this.actual[3,2] = i;

			this.actual[3,5] = l;
			this.actual[4,5] = m; 
			this.actual[5,5] = n;

			i = this.actual[0,0];
			this.actual[0,0] = this.actual[2,0];
			this.actual[2,0] =this.actual[2,2];
			this.actual[2,2] = this.actual[0,2];
			this.actual[0,2] = i;

			i = this.actual[0,1];
			this.actual[0,1] = this.actual[1,0];
			this.actual[1,0] = this.actual[2,1];
			this.actual[2,1] = this.actual[1,2];
			this.actual[1,2] = i;
			
		}

		/**
		 * Gira la cara frontal 90 grados sentido antihorario
		 */
		private void fprima(){
			int i = this.actual[0,3];
			int j = this.actual[1,3];
			int k = this.actual[2,3];
			this.actual[0,3] = this.actual[3,2];
			this.actual[1,3] = this.actual[3,1];
			this.actual[2,3] = this.actual[3,0];

			int l = this.actual[2,6];
			int m = this.actual[2,7];
			int n = this.actual[2,8];
			this.actual[2,6] = i;
			this.actual[2,7] = j;
			this.actual[2,8] = k;

			this.actual[3,0] = this.actual[3,5];
			this.actual[3,1] = this.actual[4,5]; 
			this.actual[3,2] = this.actual[5,5];

			this.actual[3,5] = n;
			this.actual[4,5] = m; 
			this.actual[5,5] = l;

			i = this.actual[0,0];
			this.actual[0,0] = this.actual[0,2];
			this.actual[0,2] =this.actual[2,2];
			this.actual[2,2] = this.actual[2,0];
			this.actual[2,0] = i;

			i = this.actual[0,1];
			this.actual[0,1] = this.actual[1,2];
			this.actual[1,2] = this.actual[2,1];
			this.actual[2,1] = this.actual[1,0];
			this.actual[1,0] = i;
			
		}

		/**
		 * Gira la cara posterior 90 grados sentido horario
		 */
		private void b(){
			int i = this.actual[0,5];
			int j = this.actual[1,5];
			int k = this.actual[2,5];
			this.actual[0,5] = this.actual[5,2];
			this.actual[1,5] = this.actual[5,1];
			this.actual[2,5] = this.actual[5,0];

			int l = this.actual[0,6];
			int m = this.actual[0,7];
			int n = this.actual[0,8];
			this.actual[0,6] = i;
			this.actual[0,7] = j;
			this.actual[0,8] = k;
			
			this.actual[5,0] = this.actual[3,3];
			this.actual[5,1] = this.actual[4,3]; 
			this.actual[5,2] = this.actual[5,3];

			this.actual[3,3] = n;
			this.actual[4,3] = m; 
			this.actual[5,3] = l;

			i = this.actual[3,6];
			this.actual[3,6] = this.actual[5,6];
			this.actual[5,6] =this.actual[5,8];
			this.actual[5,8] = this.actual[3,8];
			this.actual[3,8] = i;

			i = this.actual[3,7];
			this.actual[3,7] = this.actual[4,6];
			this.actual[4,6] = this.actual[5,7];
			this.actual[5,7] = this.actual[4,8];
			this.actual[4,8] = i;
			
		}

		/**
		 * Gira la cara posterior 90 grados sentido antihorario
		 */
		private void bprima(){
			int i = this.actual[0,5];
			int j = this.actual[1,5];
			int k = this.actual[2,5];
			this.actual[0,5] = this.actual[0,6];
			this.actual[1,5] = this.actual[0,7];
			this.actual[2,5] = this.actual[0,8];

			int l = this.actual[5,0];
			int m = this.actual[5,1];
			int n = this.actual[5,2];
			this.actual[0,6] = this.actual[5,3];
			this.actual[0,7] = this.actual[4,3];
			this.actual[0,8] = this.actual[3,3];
			
			this.actual[5,0] = k;
			this.actual[5,1] = j; 
			this.actual[5,2] = i;

			this.actual[3,3] = l;
			this.actual[4,3] = m; 
			this.actual[5,3] = n;

			i = this.actual[3,6];
			this.actual[3,6] = this.actual[3,8];
			this.actual[3,8] =this.actual[5,8];
			this.actual[5,8] = this.actual[5,6];
			this.actual[5,6] = i;

			i = this.actual[3,7];
			this.actual[3,7] = this.actual[4,8];
			this.actual[4,8] = this.actual[5,7];
			this.actual[5,7] = this.actual[4,6];
			this.actual[4,6] = i;
			
		}

		/**
		 * Gira la cara inferior 90 grados sentido horario
		 */
		private void d(){
			int i = this.actual[2,0];
			int j = this.actual[2,1];
			int k = this.actual[2,2];
			this.actual[2,0] = this.actual[5,3];
			this.actual[2,1] = this.actual[5,4];
			this.actual[2,2] = this.actual[5,5];

			int l = this.actual[2,3];
			int m = this.actual[2,4];
			int n = this.actual[2,5];
			this.actual[2,3] = i;
			this.actual[2,4] = j;
			this.actual[2,5] = k;
			
			this.actual[5,3] = this.actual[5,6];
			this.actual[5,4] = this.actual[5,7]; 
			this.actual[5,5] = this.actual[5,8];

			this.actual[5,6] = l;
			this.actual[5,7] = m; 
			this.actual[5,8] = n;
			
			i = this.actual[3,0];
			this.actual[3,0] = this.actual[5,0];
			this.actual[5,0] =this.actual[5,2];
			this.actual[5,2] = this.actual[3,2];
			this.actual[3,2] = i;

			i = this.actual[3,1];
			this.actual[3,1] = this.actual[4,0];
			this.actual[4,0] = this.actual[5,1];
			this.actual[5,1] = this.actual[4,2];
			this.actual[4,2] = i;
			
			
		}

		/**
		 * Gira la cara inferior 90 grados sentido antihorario
		 */
		private void dprima(){
			int i = this.actual[2,0];
			int j = this.actual[2,1];
			int k = this.actual[2,2];
			this.actual[2,0] = this.actual[2,3];
			this.actual[2,1] = this.actual[2,4];
			this.actual[2,2] = this.actual[2,5];

			int l = this.actual[5,3];
			int m = this.actual[5,4];
			int n = this.actual[5,5];
			this.actual[2,3] = this.actual[5,6];
			this.actual[2,4] = this.actual[5,7];
			this.actual[2,5] = this.actual[5,8];
			
			this.actual[5,3] = i;
			this.actual[5,4] = j; 
			this.actual[5,5] = k;

			this.actual[5,6] = l;
			this.actual[5,7] = m; 
			this.actual[5,8] = n;

			i = this.actual[3,0];
			this.actual[3,0] = this.actual[3,2];
			this.actual[3,2] =this.actual[5,2];
			this.actual[5,2] = this.actual[5,0];
			this.actual[5,0] = i;

			i = this.actual[3,1];
			this.actual[3,1] = this.actual[4,2];
			this.actual[4,2] = this.actual[5,1];
			this.actual[5,1] = this.actual[4,0];
			this.actual[4,0] = i;
			
			
		}

		public string to_string(){
			string s="";
			for(int i =0;i<6;i++){
				for(int j = 0;j<9;j++){
					s += this.actual[i,j].to_string()+",";
				}
				s+="\n";
			}
			return s;
		}


		/**
		 *Dibuja un cubo 3x3x3 D2 en un svg 
		 **/
		public void dibuja(double fit){
			var w  =1200;
			var h = 900;
			string s = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n"
			+"<svg width=\""+w.to_string()+"\" height=\""+h.to_string()+"\">\n"
			+"<g>\n";
			s+="<rect width='"+w.to_string()+"' height='"+h.to_string()+"' fill='black'/>\n";
			for(int i =0;i<6;i++){
				for(int j =0;j<9;j++){
					if(i<3 && j<3){
						s+= cuadro(j+3,i+3,this.actual[i,j]);
					}else if(i<3 &&j<6){
						s+= cuadro(j+3,i+3,this.actual[i,j]);
					}else if(i<3 && j<9){
						s+= cuadro(j-3,i,this.actual[i,j]);
					}else if(i>=3 && j<3){
						s+= cuadro(j+3,i+3,this.actual[i,j]);
					}else if(i>=3 && j<6){
						s+= cuadro(j-3,i,this.actual[i,j]);
					}else if(i>=3 && j<9){
						s+= cuadro(j+3,i,this.actual[i,j]);

					}
					
				}
			}
			
			
			s+="</g>"+"</svg>";
			try {
				var file = File.new_for_path ("experimentos/Cubosvg"+fit.to_string()+".svg");
				
					// delete if file already exists
				if (file.query_exists ()) {
					file.delete ();
				}
				
				var dos = new DataOutputStream (file.create (FileCreateFlags.REPLACE_DESTINATION));
				dos.put_string (s);
				
			} catch (Error e) {
				stderr.printf ("%s\n", e.message);
				
			}
			
		}

		/**
		 *Regresa el color segun el numero que le corresponde
		 */
		private string color(int c){
			string ou ="";
			switch (c) {
			case 0:
				ou = "blue";
				break;
			case 1:
				ou = "red";
				break;
			case 2:
				ou= "yellow";
				break;
			case 3:
				ou = "white";
				break;
			case 4:
				ou = "orange";
				break;
			case 5:
				ou = "green";
				break;
			}
			return ou;
		}
		
		/**
		 *Dubuja linea
		 */
		private string cuadro(int x, int y,int c){
			x=x*100;
			y=y*100;
			string cl = color(c);

			return 	"<rect x='"+x.to_string()+"' y='"+y.to_string()+"' width='100' height='100' style='fill:"+cl+";stroke:black;stroke-width:1' />\n";
		}
		

	
		
	}
}
