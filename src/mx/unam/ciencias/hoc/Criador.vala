namespace CuboGenetico{
	public class Criador{
		private FenoGeno fenogeno;
		private FFitness fitness;
		private GLib.Rand rand;

		public Criador (FenoGeno fenogeno,
						FFitness fitness,int semilla){
			this.fenogeno = fenogeno;
			this.fitness = fitness;
			this.rand = new  GLib.Rand();
			this.rand.set_seed(semilla);
		   
		}
		
		public Individuo individuoNuevo(AGenetico.Genotipo geno){
			var feno = fenogeno.decodifica(geno);
			var indi = new Individuo();
			indi.genotipo = geno;
			indi.fenotipo = feno;
			indi.fitness = fitness.evaluacion(feno);
			return indi;
		}

		public Individuo individuoNR(){
			return this.individuoNuevo(
				fenogeno.genoAleatNuev(this.rand.int_range(1,21)));
		}

		public Poblacion poblacionNuevaR(int tam){
			var po = new Poblacion();
			for(int i = 0;i<tam;i++){
				po.agregaIndividuo(this.individuoNR());
			}
			return po;
			}
	}
}
