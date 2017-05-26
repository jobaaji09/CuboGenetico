namespace CuboGenetico{
	public class CruzaUP:GLib.Object{
		private double prob;
		private rand GLib.Rand;
		
		public CruzaUP(int semilla,double prob){
			this prob = prob;
			this.rand = new GLib.Rand();
			this.rand.set_seed(semilla);
		}

		public List<int[]> cruza (List<int[]> padres){
			var p1 = padres.nth_data(0);
			var p2 = padres.nth_data(1);
			var hijo1 = new int[p1.length];
			var hijo2 = new int[p2.length];
			
		}
	}
	
}