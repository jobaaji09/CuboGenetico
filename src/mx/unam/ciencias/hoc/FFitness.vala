namespace CuboGenetico{
	public class FFitness : GLib.Object{
		
		private AGenetico.Cubo3x3 cubo;

		public FFitness(AGenetico.Cubo3x3 cubo){
			this.cubo=cubo;
		}

		public double evaluacion(AGenetico.Fenotipo feno){
			this.cubo.giraCaras(feno.fenotipo);
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
			//this.cubo.dibuja(fitness/6+geno.genotipo.length);
			this.cubo.reset();
			//double g = feno.fenotipo.length/10.0;
			//stdout.printf("%2.3f\n",(fitness/6)*g);
			return (fitness/6.0);
		}

		public double caraFitness(int centro,int x,int y){
			//double esq = 0.0;
			//double art = 0.0;
			double f =0.0;
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
			//var f = (art/4.0) + (esq/4.0);
			
			return 1.0 - (f/8.0);
		}

		

		
		   
	}

}
