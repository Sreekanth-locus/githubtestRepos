

<%@ include file="../../commonjsp/autherisation.jsp" %>
<%@ include file="../../commonjsp/errortop.jsp" %>

<jsp:useBean id="cfc" class="com.locus.edumanage.common.CommonFeatureClass" scope="page" />
<%@ taglib uri="../../WEB-INF/taglib/OptionListNew" prefix="date" %>
<%@ taglib uri="../../WEB-INF/taglib/DBDynamicList" prefix="dblist" %>
<%@ taglib uri="../../WEB-INF/taglib/TimeList" prefix="time" %>
<jsp:useBean id="obj" class="com.locus.edumanage.department.Dep_BusinessProposalEntity" scope="page"/>

<%
  String programid="",batchno="",noofs="";

  int stat=0;
  int noofstdnt=0;

  noofs=request.getParameter("noofstudent");

  programid=request.getParameter("programid");
  batchno=request.getParameter("batch");

  stat=Integer.parseInt(request.getParameter("stat"));
  noofstdnt=Integer.parseInt(request.getParameter("noofstudent"));

  if(stat==1){
  %>
    <script>
       window.close();
    </script>
  <%  
  }

  Vector vec=new Vector();

  vec=Dep_ItecstdntregDB.getStudents(batchno);

%>
<html>
<head>
<script src="../presentation/script/eduscript.js">
</script>
<script language="javascript" type="text/javascript" src="../presentation/script/actb.js"></script>
<script language="javascript" type="text/javascript" src="../presentation/script/common.js"></script>

<script>
  var Alert_Msg=new Array(30);
  Alert_Msg[0]="Client Short Name";
  
  

  function MM_openWindow(theURL,winName,features) {   
    window.open(theURL,winName,features);
  } 

  function checkDate(frm) {

    var message = "";
    var flag = true;
  
    if(validate(frm,Alert_Msg))
    {
     
    if(flag == false) {
      alert(message);
      return false;
     }
    }
    else
    {
      return false;
    }
   }
  
  </script>
  <script type="text/javascript">
    function chkcontrol(j) {
      var add=document.getElementById("adds");
      var nof=add.value;
      var total=0;
      for(var i=0; i < document.edu.accomodation.length; i++){
        if(document.edu.accomodation[i].checked){
          total =total +1;}
        if(total > nof){
          alert("Please Select only "+nof+" Rooms") 
          document.edu.accomodation[j].checked = false ;
          return false;
        }
      }
    }
  </script>

<LINK REL=stylesheet href="../presentation/css/functionality.css" TYPE="text/css">

</head>

<body>

<script language="JavaScript">

function MM_openBrWindow(theURL,winName,features) {
  window.open(theURL,winName,features);
}

// handle keyboard events
var moz = false;
if (navigator.appName == "Mozilla" || (navigator.appName == "Netscape" && navigator.appVersion.indexOf("4.") == -1))
   moz = true;

if (moz)
   document.addEventListener("keyup",keypress,true);
else if(navigator.appName == "Netscape" && navigator.appVersion.indexOf("4.x") != -1)
   document.captureEvents(Event.KEYPRESS);
 
if (!moz)  
    document.onkeydown=keypress;
     

// perform action based on keypress and state info
function keypress(e) { 
   if (navigator.appName == "Microsoft Internet Explorer") 
      tmp = window.event.keyCode;
   else if (moz)
  tmp = e.keyCode;
  
  //to capture alt+x to exit and alt+p for print
  if((moz && Event.ALT_MASK) ||(window.event.altKey)){
    if(tmp==88)
    document.location.href="EduManage.jsp?control=-1";
    if(tmp==80){                          
      prnscr();
    }

    //to capture alt+ A,B,C upto M for menus
    var arr=new Array(13);
    var charcount=65;
    for(var i=0;i<13;i++){
      arr[i]=charcount;
      charcount++;
    }
    for(var k=1;k<=13;k++){
      if(tmp==arr[k-1]){                      
        document.location.href=document.links[k].href;        
        return false;                             
      }
    }
  } 

  //to capture F1
  if(tmp==112){
  document.onhelp = 
    function () {           
      return false;
      };
     
  }
}

function prnscr()
{
  document.getElementById('rptscrtbl').style.visibility='hidden';
  document.getElementById('rptscrtbl').style.position='absolute';
  window.print();
  setTimeout('reappear()',4000);
}
function reappear(){
  document.getElementById('rptscrtbl').style.visibility='visible';
  document.getElementById('rptscrtbl').style.position='relative';
}

function stylePopup(){
  window.open('EduManage.jsp?control=style1','stylewin','height=288,width=432'); 
 }
</script>
<LINK rel="stylesheet" type="text/css" href="../presentation/theme/spring/css/theme.css" id="stylelink" title="stylelink">
<LINK href="../presentation/css/header.css" type="text/css" rel="stylesheet">
<STYLE type=text/css>.class1 {
  FONT-SIZE: 7.5pt;color:ffffff;FONT-FAMILY: Verdana;TEXT-DECORATION: none
}
.class2 {
  FONT-SIZE: 7.5pt;color:ffffff;FONT-FAMILY: Verdana;TEXT-DECORATION: none
}
.class2 A:active {
  COLOR: white; TEXT-TRANSFORM: none;  
}
.class2 A:hover {
  COLOR: white; TEXT-TRANSFORM: none; 
}

.sclass {
  FONT-SIZE: 7.5pt;color:000000;FONT-FAMILY: Verdana;TEXT-DECORATION: none
}
  .searchinput {
  MARGIN: 0px;
  BACKGROUND-COLOR: #ffffff;
  BORDER-BOTTOM: #000000 1px solid; 
  BORDER-LEFT: #000000 1px solid; 
  BORDER-RIGHT: #000000 1px solid; 
  BORDER-TOP: #000000 1px solid;
  FONT-FAMILY: Verdana;
  FONT-SIZE: 11px;
  color: #000000;
  width: 150px;
  } 
</style>
<title>:: EduManage - BDU ::</title>
<body leftmargin="0" bgcolor="#ffffff" topmargin="0" marginwidth="0" marginheight="0">
<br>

<script>
function submitform(){  
  document.getElementById("eedu").submit();
}
</script>

  <table width="80%" class="zero">
      <td colspan="3">
        <table width="90%" align="center">
          <form action="EduManage.jsp" method="post" name="edu" id="edu" onSubmit="return checkDate(this)">
            <table width="110%" style="margin-left: 40;">
              <tr>
                <td class="bg" colspan="10">Student Selection</td> 
              </tr>
              <tr>
                <td class="bg1">Program ID</td>
                <td class="bg1"><%=programid%></td>
                <td class="bg1">Batch NO</td>
                <td class="bg1"><%=batchno%></td>
              </tr>
              <tr>
                <td class="bg1">No of Students</td>
                <td class="bg1"><input name="noofrooms" id="adds" value="<%=noofstdnt%>" readonly=""/></td>
                <td class="bg1"></td>
                <td class="bg1"></td>
              </tr>
              <tr>
                <td class="bg" colspan="10">Students</td>
              </tr>
              <tr>
                <td align="center" class="bg1" colspan="10">
                    <%for(int i=0;i<vec.size();i++){%>
                        <input type="checkbox" name="stdntname" value="<%=vec.get(i)%>" onclick='chkcontrol(<%=i%>)'/><%=vec.get(i)%>
                    <%}%>    
                </td>
               </tr>
              <tr>
                <td class="bg" align="center" colspan="10">
                  <edu:input type="hidden" name="control" value="2_6a2p8"/>
                  <edu:input type="hidden" name="programid" value="<%=programid%>"/>
                  <edu:input type="hidden" name="batchno" value="<%=batchno%>"/>
                  <edu:input type="hidden" name="noofs" value="<%=noofs%>"/>    
                  <edu:input type="submit" name="Add" value="Add"/>
                </td> 
              </tr>
            </table>
          </form>
        </table>
       </td>
    </tr>
</table>

</body>
</html>
<%@ include file="../../commonjsp/errorfooter.jsp" %>