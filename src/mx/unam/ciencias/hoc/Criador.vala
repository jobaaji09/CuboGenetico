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

		public AGenetico.Individuo individuoNuevo(int[] geno){
			var feno = fenogeno.decodifica(geno);
			var indi = new AGenetico.Individuo();
			indi.genotipo = geno;
			indi.fenotipo = feno;
			indi.fitness = fitness.evaluacion(geno);
			return indi;
		}

		public AGenetico.Individuo individuoNR(){
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
