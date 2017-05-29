namespace CuboGenetico.AGenetico{
	public class Cubo2x2{
		private int[,] inicial;
		private int[,] actual;
        /**
         * Constructor para un Cubo 3x3x3.
         */
		
		public Cubo2x2(int[,] cubo){
			this.inicial =cubo;
			this.actual = new int[6,9];
		    for(int i=0;i<4;i++){
				for(int j=0;j<6;j++){
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
			for(int i =0;i<4;i++){
				for(int j=0;j<6;j++){
					this.actual[i,j] = this.inicial[i,j];
				}
			}
		}


		public string to_string(){
			string s="";
			for(int i =0;i<4;i++){
				for(int j = 0;j<6;j++){
					s += this.actual[i,j].to_string()+",";
				}
				s+="\n";
			}
			return s;
		}


		/**
		 *Dibuja un cubo 3x3x3 D2 en un svg 
		 **/
		public void dibuja(string name){
			var w  =800;
			var h = 600;
			string s = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n"
			+"<svg width=\""+w.to_string()+"\" height=\""+h.to_string()+"\">\n"
			+"<g>\n";
			s+="<rect width='"+w.to_string()+"' height='"+h.to_string()+"' fill='black'/>\n";
			for(int i =0;i<4;i++){
				for(int j =0;j<6;j++){

					if(i<2 && j<2){
						s+= cuadro(j+2,i+2,this.actual[i,j]);
					}else if(i<2 && j<4){
						s+= cuadro(j+2,i+2,this.actual[i,j]);
					}else if(i<2 && j<6){
						s+= cuadro(j-2,i,this.actual[i,j]);
					}else if(i>=2 && j<2){
						s+= cuadro(j+2,i+2,this.actual[i,j]);
					}else if(i>=2 && j<4 ){
						s+= cuadro(j-2,i,this.actual[i,j]);
					}else if(i>=2 && j<6)  {
						s+= cuadro(j+2,i,this.actual[i,j]);
					}
				}
			}
			
			
			s+="</g>"+"</svg>";
			try {
				var file = File.new_for_path ("experimentos/Cubosvg"+name+".svg");
				
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
				ou = "deepskyblue";
				break;
			case 1:
				ou = "hotpink";
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
				ou = "chartreuse";
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