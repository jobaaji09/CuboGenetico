
namespace CuboGenetico{
	public class CruzaUP:GLib.Object{
		private double prob;
		private GLib.Rand rand;
		
		public CruzaUP(int semilla,double prob){
			this.prob = prob;
			this.rand = new GLib.Rand();
			this.rand.set_seed(semilla);
		}
		/*
		public List<AGenetico.Individuo> cruza (List<int[]> padres){
			var p1 = padres.nth_data(0);
			var p2 = padres.nth_data(1);
			var hijo1 = new int[p1.length];
			var hijo2 = new int[p2.length];
			if(this.rand.next_double()<this.prob){
				int punto =0;
				if(p1.length<p2.length){
					punto = (p1.length/2)+1;
				}else{
					punto = (p2.length/2)+1;
				}
				for(int i=0; i<punto;i++){
					hijo1[i] = p2[i];
					hijo2[i] = p1[i];
				}
				for(int i=punto; i<p1.length;i++){
					hijo1[i] = p1[i];
				}
				for(int i=punto; i<p2.length;i++){
					hijo2[i] = p2[i];
				}
			}else{
				for(int i=0; i<p1.length;i++){
					hijo1[i] = p1[i];
				}
				for(int i=0; i<p2.length;i++){
					hijo2[i] = p2[i];
				}
				}
			var l = new List<int[]>();
			l.append(hijo1);
			l.append(hijo2);
			return l;
			
			}*/
	}
	
}