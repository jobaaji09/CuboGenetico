namespace CuboGenetico{
	public class STorneo{
		private GLib.Rand rand;
		
		public STorneo(int semilla){
			this.rand = new GLib.Rand();
			this.rand.set_seed(semilla);
		}

		public List<AGenetico.Genotipo> selecciona(Poblacion p ){
			var l =  new List<AGenetico.Genotipo>();
			int i =0;
			while(i<2){
				var i1 =p.getIndividuo((int)this.rand.int_range(0,p.getTam()));
				var i2 =p.getIndividuo((int)this.rand.int_range(0,p.getTam()));
				var i3 =p.getIndividuo((int)this.rand.int_range(0,p.getTam()));
				var i4 =p.getIndividuo((int)this.rand.int_range(0,p.getTam()));
				Individuo  mejor  = null;
				if(i1.fitness <= i2.fitness){ //&& i1.genotipo.genotipo.length<=i2.genotipo.genotipo.length){
					mejor = i1;
				}else{
					mejor = i2;
				}
				
				if(i3.fitness <=mejor.fitness){// && i3.genotipo.genotipo.length<=mejor.genotipo.genotipo.length){
					mejor = i3;
				}
				
				if(i4.fitness <=mejor.fitness){ //&& i4.genotipo.genotipo.length<=mejor.genotipo.genotipo.length){
					mejor = i4;
				}
				l.append(mejor.genotipo);
				i++;
			}
			return l;
		}
	}
	
}