namespace CuboGenetico.AGenetico{

	public class Individuo:GLib.Object{

		public int[] genotipo { get; set; }
		public string[] fenotipo { get; set; }
		public double fitness { get; set; }

		public string to_string(){
			string s ="Genotipo: ";
			foreach(int i in genotipo){
				s += i.to_string()+",";
			}
			s+="\nFenotipo: ";
			foreach(string i in fenotipo){
				s += i.to_string()+",";
			}
			s+="\nFitness: " + fitness.to_string();
			return s;
		}
		
	}
}