namespace CuboGenetico{
	public class Mutacion:GLib.Object{

		private double prop;
		private GLib.Rand rand;
		
		public Mutacion(int semilla , double prop){
			this.rand = new GLib.Rand();
			this.rand.set_seed(semilla);
			this.prop = prop;
		}


		public AGenetico.Genotipo muta(AGenetico.Genotipo g){
			var nuevo = new AGenetico.Genotipo(g.genotipo.length);
			for(int i = 0; i< g.genotipo.length;i++){
				if(this.rand.next_double() < this.prop){
					nuevo.genotipo[i] = (int)this.rand.int_range(1,13);
				}else{
					nuevo.genotipo[i] = g.genotipo[i]; 
				}
			}
			return nuevo;
		}
		
	}

}