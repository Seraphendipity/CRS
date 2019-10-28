using System;

namespace CRS
{
    public class  Student
    {
        int id {get; set;}
        bool bActive {get; set;}
        String fName {get; set;}
        String mName {get; set;}
        String lName {get; set;}
        String blazerName {get; set;}
        DateTime dateBirth {get; set;}
        int imageId {get; set;}
        DateTime dateEnroll {get; set;}
        int[] declaredMajorsIds {get; set;}
        int[] declaredMinorsIds {get; set;}

        public String getName() {
            return new String("DEFAULT");
        }

        // getName():  Returns full name as string.
        // getNames(): Returns full name as array.
        // getNameCommon(): Returns first and last names as a string.
        // getNameInversed(): Returns the full name as string, last name first, then comma, then first name then middle inital, as a string.
    }
}