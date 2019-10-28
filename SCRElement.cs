namespace CRS
{
    public class SCRElement
    {
        private int idCounter {get; set;}
        private int id {get; set;}
        private bool bActive {get; set;} //<!-- Time (semester ending) and Action (dropping) Dependent -->
        
        protected void generateId () {
            // Could be a hash later, with first few digits indicating element
            id = idCounter++;
        }
    }
}