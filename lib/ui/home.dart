import 'package:corona/model/json.dart';
import 'package:corona/network/network.dart';
import 'package:corona/ui/midView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class Corona extends StatefulWidget {
  @override
  _CoronaState createState() => _CoronaState();
}

class _CoronaState extends State<Corona> {
  Future<CoronaModel> coronaObject;
  String _countryName ="India";

  @override
  void initState(){
    super.initState();
    coronaObject =getData(countryName: _countryName);
      }
      
      
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.grey[400],
          appBar: AppBar(
            backgroundColor: Colors.red[300],
            title: Text("Corona Tracker",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),
          ),
          drawer: Drawer(
            
            child: ListView(
              children: <Widget>[
                DrawerHeader(child: Image.asset("images/doctor.jpg",),
                decoration: new BoxDecoration(
                  color: Colors.blue[300]
                ),
                ),
                ListTile(
                  leading: Icon(Icons.warning),
                  title: Text("Precautions"),
                  trailing: Icon(Icons.open_in_new),
                  onTap: (){Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context)=> Precautions()));},
                ),
                
               
              ],
            ),),
          body: ListView(
            
            children: <Widget>[
              
              textField(),
              Container(
            
                child: FutureBuilder<CoronaModel>(
                  future: coronaObject,
                  builder: (BuildContext context,AsyncSnapshot<CoronaModel> snapshot){
                    if(snapshot.hasData){
                      return Column(children: <Widget>[
                        midView(snapshot),

                        Padding(
                        
                          padding: const EdgeInsets.only(top: 70.0),
                            child: GestureDetector(
                              onTap: () {
                                final snackBar = SnackBar(content: Text("OK BYE!!!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black
                                ),),
                                backgroundColor: Colors.tealAccent,);
                                Scaffold.of(context).showSnackBar(snackBar);
                              },
                              child: Image.asset("images/imageAsset.jpg",
                              
                              ),
                            ),
                          ),
                        
                        
                      ],);
                    }
                    else{
                      return Container(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.redAccent,
                        ),);
                    }
                  }),
              )
            ],
          ),
        );
          
        
      }
    
      Future<CoronaModel> getData({String countryName}) =>
      new Network().getData(countryName: _countryName);

  List<String> _locations = [
	"Afghanistan",
	"Algeria",
	"American Samoa",
	"Andorra",
	"Angola",
	"Anguilla",
	"Antarctica",
	"Antigua and Barbuda",
	"Argentina",
	"Armenia",
	"Aruba",
	"Australia",
	"Austria",
	"Azerbaijan",
	"Bahrain",
	"Bangladesh",
	"Barbados",
	"Belarus",
	"Belgium",
	"Belize",
	"Benin",
	"Bermuda",
	"Bhutan",
	"Bolivia",
	"Bosnia and Herzegovina",
	"Botswana",
	"Bouvet Island",
	"Brazil",
	"Brunei Darussalam",
	"Bulgaria",
	"Burkina Faso",
	"Burundi",
	"Cabo Verde",
	"Cambodia",
	"Cameroon",
	"Canada",
	"Cayman Islands",
	"Central African Republic",
	"Chad",
	"Chile",
	"China",
	"Colombia",
	"Comoros ",
	"Congo",
	"Congo",
	"Cook Islands",
	"Costa Rica",
	"Croatia",
	"Cuba",
	"Cyprus",
	"Czechia",
	"Côte d'Ivoire",
	"Denmark",
	"Djibouti",
	"Dominica",
	"Ecuador",
	"Egypt",
	"El Salvador",
	"Equatorial Guinea",
	"Eritrea",
	"Estonia",
	"Eswatini",
	"Ethiopia",
	"Falkland Island",
	"Faroe Islands",
	"Fiji",
	"Finland",
	"France",
	"Gabon",
	"Georgia",
	"Germany",
	"Ghana",
	"Gibraltar",
	"Greece",
	"Greenland",
	"Grenada",
	"Guadeloupe",
	"Guam",
	"Guatemala",
	"Guernsey",
	"Guinea",
	"Guinea-Bissau",
	"Guyana",
	"Haiti",
	"Honduras",
	"Hong Kong",
	"Hungary",
	"Iceland",
	"India",
	"Indonesia",
	"Iran",
	"Iraq",
	"Ireland",
	"Israel",
	"Italy",
	"Jamaica",
	"Japan",
	"Jordan",
	"Kazakhstan",
	"Kenya",
	"Kiribati",
	"Korea",
	"Korea",
	"Kuwait",
	"Kyrgyzstan",
	"Latvia",
	"Lebanon",
	"Lesotho",
	"Liberia",
	"Libya",
	"Liechtenstein",
	"Lithuania",
	"Luxembourg",
	"Macao",
	"Madagascar",
	"Malawi",
	"Malaysia",
	"Maldives",
	"Mali",
	"Malta",
	"Martinique",
	"Mauritania",
	"Mauritius",
	"Mayotte",
	"Mexico",
	"Moldova",
	"Monaco",
	"Mongolia",
	"Montenegro",
	"Morocco",
	"Mozambique",
	"Myanmar",
	"Namibia",
	"Nauru",
	"Nepal",
	"Netherlands",
	"New Zealand",
	"Nicaragua",
	"Niger",
	"Nigeria",
	"Niue",
	"Norfolk Island",
	"Norway",
	"Oman",
	"Pakistan",
	"Palau",
	"Panama",
	"Paraguay",
	"Peru",
	"Philippines",
	"Poland",
	"Portugal",
	"Puerto Rico",
	"Qatar",
	"Romania",
	"Russia",
	"Rwanda",
	"Samoa",
	"San Marino",
	"Saudi Arabia",
	"Senegal",
	"Serbia",
	"Sierra Leone",
	"Singapore",
	"Slovakia",
	"Slovenia",
	"Solomon Islands",
	"Somalia",
	"South Africa",
	"South Georgia",
	"South Sudan",
	"Spain",
	"Sri Lanka",
	"Sudan",
	"Suriname",
	"Sweden",
	"Switzerland",
	"Syria",
	"Taiwan",
	"Tajikistan",
	"Tanzania",
	"Thailand",
	"Togo",
	"Tokelau",
	"Tonga",
	"Tunisia",
	"Turkey",
	"Turkmenistan",
	"Tuvalu",
	"Uganda",
	"Ukraine",
	"United Arab Emirates",
	"US",
	"Uruguay",
	"Uzbekistan",
	"Vanuatu",
	"Venezuela ",
	"Viet Nam",
	"Virgin Islands",
	"Wallis and Futuna",
	"Western Sahara",
	"Yemen",
	"Zambia",
	"Zimbabwe",
];


  Widget textField() {
    return Container(
      child: DropdownButton<String>(
        items: _locations.map((String dropDownStringItem){
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      hint: Text("choose"),
      value: _countryName,
      onChanged: (String newValue){
        setState(() {
          _countryName =newValue;
           coronaObject=getData(countryName: _countryName);
        });
      },
      isExpanded: true,
      icon: Icon(Icons.search),
      )
      // child: TextField(
        
      //   decoration:InputDecoration(
          
      //     prefixIcon: Icon(Icons.search),
      //     hintText: "Enter Country Name",

      //   ),
      //   onSubmitted: (value){
      //     setState(() {
      //       _countryName=value;
      //       coronaObject=getData(countryName: _countryName);
      //     });
      //   },
      // ),
    );
  }
}


class Precautions extends StatefulWidget {
  @override
  _PrecautionsState createState() => _PrecautionsState();
}

class _PrecautionsState extends State<Precautions> {
  

  var precautionList =[
    "Clean your hands often.",
    " Use soap and water, or an alcohol-based hand rub.",
    "Maintain a safe distance from anyone who is coughing or sneezing.",
    "Don’t touch your eyes, nose or mouth.",
    "Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.",
"Stay home if you feel unwell.",
"If you have a fever, a cough, and difficulty breathing, seek medical attention. Call in advance.",
"Follow the directions of your local health authority."];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        leading: new IconButton(icon: Icon(Icons.backspace,), 
        onPressed:(){ Navigator.pop(context);}) 
      ),
      body: Container(
        color: Colors.teal[50],
        child: ListView.builder(
          itemCount: precautionList.length,
          itemBuilder: (BuildContext context,int index){
            return ListTile(
              leading: Icon(Icons.adjust),
              title: Text(precautionList[index],style: TextStyle(
                fontSize: 18
                
              ),),
            );
          }
          )
        )
      );
  }
}