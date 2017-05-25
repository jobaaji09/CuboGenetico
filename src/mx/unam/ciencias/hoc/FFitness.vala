namespace CuboGenetico{
	public class FFitness : GLib.Object{
		
		private Cubo.Cubo3x3 cubo;

		public FFitness(Cubo.Cubo3x3 c){
			this.cubo = c;
		}

		public double evaluacion(int[] feno){
			this.cubo.giraCaras(feno);
			double fitness = 0.0;
			for(int i=0;i<6;i++){
				switch(i){
				case 0:
					fitness += caraFitness(i,i+1,i+1);
					break;
				case 1:
					fitness += caraFitness(i,i,i+3);
					break;
				case 2:
					fitness += caraFitness(i,i-1,i+5);
					break;
				case 3:
					fitness += caraFitness(i,i+1,i-2);
					break;
				case 4:
					fitness += caraFitness(i,i,i);
					break;
				case 5:
					fitness += caraFitness(i,i-1,i+2);
					break;
					
				}
			}
			return fitness/6;
		}

		public double caraFitness(int centro,int x,int y){
			double f = 0.0;
			var c = this.cubo.getActual();
			if(centro == c[x-1,y-1] ){
				f = f +1;
			}
			if(centro == c[x-1,y] ){
				f = f +1;
			}
			if(centro == c[x-1,y+1] ){
				f = f +1;
			}
			if(centro == c[x,y-1] ){
				f = f +1;
			}
			
			if(centro == c[x,y+1] ){
				f = f +1;
			}
			if(centro == c[x+1,y-1] ){
				f = f +1;
			}
			if(centro == c[x+1,y] ){
				f = f +1;
			}
			if(centro == c[x+1,y+1] ){
				f = f +1;
			}
			return 1 - (f/8);
		}

		

		
		   
	}

}