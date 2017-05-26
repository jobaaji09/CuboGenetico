namespace CuboGenetico{
	public class SRuleta{
		private GLib.Rand rand;
		
		public SRuleta(int semilla){
			this.rand = new GLib.Rand();
			this.rand.set_seed(semilla);
		}

		public List<AGenetico.Individuo> selecciona(Poblacion p ){
			double[] rango = new double[p.getTam()];
			rango[0] = p.getIndividuo(0).fitness;
			for(int i=1;i<p.getTam();i++){
				double m = rango[i-1]/(p.getIndividuo(i).fitness)*10;
				rango[i] = m+rango[i-1];
			}
			var l = new List<AGenetico.Individuo>();
			for(int i=0;i<2;i++){
				double pestania = rand.next_double()*rango[rango.length-1];
				int j =0;
				while(rango[j]<=pestania){
					stdout.printf("p = %2.9f , r = %2.9f\n",pestania,rango[j]);
					j++;
				}
				l.append(p.getIndividuo(j));
			}
			return l;
		}
	}
	
}