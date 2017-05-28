namespace CuboGenetico{
	public class Criador{
		private FenoGeno fenogeno;
		private FFitness fitness;
		private Corrector corrector;
		private GLib.Rand rand;

		public Criador (FenoGeno fenogeno,
						FFitness fitness,
						Corrector corrector,
						int semilla){
			this.fenogeno = fenogeno;
			this.fitness = fitness;
			this.corrector =corrector;
			this.rand = new  GLib.Rand();
			this.rand.set_seed(semilla);
		   
		}
		
		public Individuo individuoNuevo(AGenetico.Genotipo geno){
			var ngeno = this.corrector.reparaG(geno);
			var feno = fenogeno.decodifica(ngeno);
			var indi = new Individuo();
			indi.genotipo = ngeno;
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
