namespace CuboGenetico{
	public class Poblacion{

		private List<Individuo> poblacion;
		
		public int generacion {get; set;}

		public Individuo mejorInd {get; set;}
		
		
		public Poblacion(){
			this.generacion = 0;
			this.poblacion = new List<Individuo>();
		}

		public void agregaIndividuo(Individuo ind){
			if(this.mejorInd == null){
				this.mejorInd = ind;
			}else if(this.mejorInd.fitness>=ind.fitness){
				this.mejorInd = ind;
			}
			this.poblacion.append(ind);
		}

		public Individuo getIndividuo(int i){
			return poblacion.nth_data (i);
		}

		public int getTam(){
			return (int)this.poblacion.length();
		}
		
	}
}