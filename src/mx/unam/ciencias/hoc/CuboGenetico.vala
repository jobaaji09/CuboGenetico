namespace CuboGenetico{
	class CuboGenetico :GLib.Object {
	    private Criador criador;
		private STorneo sr ;
		private CruzaUP cruza;
		private Mutacion mutacion;
		private int tamp;
		private Individuo mejorg;
		public CuboGenetico(FFitness ffitness,
							FenoGeno fenogeno,
							Corrector corrector,
							STorneo sr,
							CruzaUP cruza,
							Mutacion mutacion,
							int semilla,
							int tamp){
			this.criador = new Criador(fenogeno,ffitness,corrector,semilla);
			this.sr = sr;
			this.cruza = cruza;
			this.mutacion = mutacion;
			this.tamp = tamp;
		}

		public Individuo mejor{
			get { return mejorg; }
		}
		public Poblacion iteracion(Poblacion actual){
			Poblacion pnueva = new Poblacion();
			pnueva.generacion = actual.generacion +1;
			pnueva.agregaIndividuo(actual.mejorInd);
			while (pnueva.getTam() < actual.getTam()){
				//seleccion
				var select = this.sr.selecciona(actual);
				//Cruza
				var cross = this.cruza.cruza(select);
				//Mutacion
				
				var mut = new List<AGenetico.Genotipo>();
				foreach(AGenetico.Genotipo g in cross){
					mut.append(this.mutacion.muta(g));
				}

				foreach(AGenetico.Genotipo g in mut){
					pnueva.agregaIndividuo(criador.individuoNuevo(g));
				}
			}
			var m = pnueva.mejorInd;
			if(m.fitness <= this.mejorg.fitness){
				this.mejorg = m;
			}
			return pnueva;
		}

		public void run(){
			Poblacion p = this.criador.poblacionNuevaR(this.tamp);
			this.mejorg = p.mejorInd;
			while(p.generacion<=500){
				p = this.iteracion(p);
				//stdout.printf("%s\n",p.mejorInd.to_string());
			}
		}
		

		
		
	}
}
