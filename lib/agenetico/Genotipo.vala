namespace CuboGenetico.AGenetico{

	public class Genotipo{
		private int[] geno;
		
		public int[] genotipo {
			get { return geno; }
		}

		public Genotipo (int n){
			this.geno = new int[n];
		}

		public string to_string(){
			string s = "Genotipo: ";
			foreach(int i in this.geno){
				s+= i.to_string()+",";
			}
			s+="\n";
			return s; 
		}
	}
}