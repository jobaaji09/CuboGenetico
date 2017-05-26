
namespace CuboGenetico{
	public class CruzaUP:GLib.Object{
		private double prob;
		private GLib.Rand rand;
		
		public CruzaUP(int semilla,double prob){
			this.prob = prob;
			this.rand = new GLib.Rand();
			this.rand.set_seed(semilla);
		}
		
		public List<AGenetico.Genotipo> cruza (List<AGenetico.Genotipo> padres){
			var p1 = padres.nth_data(0);
			var p2 = padres.nth_data(1);
			var hijo1 = new AGenetico.Genotipo(p1.genotipo.length);
			var hijo2 = new AGenetico.Genotipo(p2.genotipo.length);
			if(this.rand.next_double()<this.prob){
				int punto =0;
				if(p1.genotipo.length<p2.genotipo.length){
					punto = (p1.genotipo.length/2);
				}else{
					punto = (p2.genotipo.length/2);
				}
				for(int i=0; i<punto;i++){
					hijo1.genotipo[i] = p2.genotipo[i];
					hijo2.genotipo[i] = p1.genotipo[i];
				}
				for(int i=punto; i<p1.genotipo.length;i++){
					hijo1.genotipo[i] = p1.genotipo[i];
				}
				for(int i=punto; i<p2.genotipo.length;i++){
					hijo2.genotipo[i] = p2.genotipo[i];
				}
			}else{
				for(int i=0; i<p1.genotipo.length;i++){
					hijo1.genotipo[i] = p1.genotipo[i];
				}
				for(int i=0; i<p2.genotipo.length;i++){
					hijo2.genotipo[i] = p2.genotipo[i];
				}
				}
			var l = new List<AGenetico.Genotipo>();
			l.append(hijo1);
			l.append(hijo2);
			return l;
			
		}
	}
	
}