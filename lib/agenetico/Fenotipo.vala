namespace CuboGenetico.AGenetico{

	public class Fenotipo{
		private string[] feno;
		
		public string[] fenotipo {
			get { return feno; }
		}

		public Fenotipo (int n){
			this.feno = new string[n];
		}

		public string to_string(){
			string s = "Fenotipo: ";
			foreach(string i in this.feno){
				s+= i+",";
			}
			s+="\n";
			return s; 
		}
	}
}