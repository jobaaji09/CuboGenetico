namespace CuboGenetico{

	public class Individuo:GLib.Object{

		public AGenetico.Genotipo genotipo { get; set; }
		public AGenetico.Fenotipo fenotipo { get; set; }
		public double fitness { get; set; }

		public string to_string(){
			string s =fenotipo.to_string() +
			genotipo.to_string() +
			"Fitness : " + fitness.to_string() + "\n";
			return s;
		}
		
	}
}