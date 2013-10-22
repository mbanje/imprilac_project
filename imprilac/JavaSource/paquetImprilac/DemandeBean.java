package paquetImprilac;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.faces.model.SelectItem;

public class DemandeBean {
	
	private String message;

	private int idMateriel=0;
	private int quantiteMateriel=0;
	private int quantiteDmd=0;
	private int quantiteMatAccord=0;
	private int idDmd;
	private String designationMat;
	private List<DemandeBean> listDesProdDmd;
	private List<DemandeBean> listDesMateriaux;
	private List<SelectItem> listDesDmdNonEtudiees;
	private List<SelectItem> listAutorisation;
	private List<SelectItem> listDmdEnCourtEtEtudi;
	private List<SelectItem> listMatAccordees;
	private List<SelectItem> listDmdPourHisto;
	private List<SelectItem> listDMatPourHisto;
	//Liste des materiaux non encore evaluees(par le gerant)
	//se trouvant sur une demande.
	private List<SelectItem> listDesMatNonEvalueSeTrouvSurUneDmd;
	private String nom;
	private String prenom;
	private String autorisation=null;
	private String motivation;
	

	
	
	
	
	
	
	
	
	public List<SelectItem> getListDMatPourHisto() {
		
		ResultSet res=null;
		if(listDMatPourHisto==null)
			listDMatPourHisto=new ArrayList<SelectItem>();
		else
			listDMatPourHisto.clear();
		
		res=Connecteur.Extrairedonnees("select m.Idmateriel,m.Designation from unite_dmde uni,materiel m where uni.Iddmd="+this.idDmd+" and uni.Idgestion is not null and uni.Idmateriel=m.Idmateriel and m.Historisation='OUI'");
		
		listDMatPourHisto.add(new SelectItem(0," "));
		try {
			while(res.next())
			{
		listDMatPourHisto.add(new SelectItem(res.getInt("Idmateriel"),res.getString("Designation")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return listDMatPourHisto;
	}


	public void setListDMatPourHisto(List<SelectItem> listDMatPourHisto) {
		this.listDMatPourHisto = listDMatPourHisto;
	}


	public List<SelectItem> getListDmdPourHisto() {
		
		ResultSet res=null;
		if(listDmdPourHisto==null)
			listDmdPourHisto=new ArrayList<SelectItem>();
		else
			listDmdPourHisto.clear();
		
		res=Connecteur.Extrairedonnees("select Iddemande from demande where Iddemande in (Select d.Iddemande from demande d,unite_dmde u where d.Iddemande=u.Iddmd and d.Iddemande in ( select uni.Iddmd from unite_dmde uni,materiel m where uni.Idgestion is not null and uni.Idmateriel=m.Idmateriel and m.Historisation='OUI'))");
		
		listDmdPourHisto.add(new SelectItem(0," "));
		try {
			while(res.next())
			{
				listDmdPourHisto.add(new SelectItem(res.getInt("Iddemande"),""+res.getInt("Iddemande")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listDmdPourHisto;
	}


	public void setListDmdPourHisto(List<SelectItem> listDmdPourHisto) {
		this.listDmdPourHisto = listDmdPourHisto;
	}


	public List<SelectItem> getListMatAccordees() {
		
		ResultSet res=null;
		if(listMatAccordees==null)
			listMatAccordees=new ArrayList<SelectItem>();
		else
			listMatAccordees.clear();
		
		res=Connecteur.Extrairedonnees("Select m.Idmateriel,m.Designation from unite_dmde u,materiel m where u.Iddmd="+this.idDmd+" and u.Idmateriel=m.Idmateriel and u.Idgestion is null and Autorisation='OUI'");
		
		listMatAccordees.add(new SelectItem(0," "));
		try {
			while(res.next())
			{
				listMatAccordees.add(new SelectItem(res.getInt("Idmateriel"),res.getString("Designation")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listMatAccordees;
	}
	
	
	public void setListMatAccordees(List<SelectItem> listMatAccordees) {
		this.listMatAccordees = listMatAccordees;
	}
	
	public List<SelectItem> getListDmdEnCourtEtEtudi() {
		ResultSet res=null;
		if(listDmdEnCourtEtEtudi==null)
			listDmdEnCourtEtEtudi=new ArrayList<SelectItem>();
		else
			listDmdEnCourtEtEtudi.clear();
		
		res=Connecteur.Extrairedonnees("Select * from demande where Etatdmd='ETUDE EN COURT' or Etatdmd='ETUDIEE' and Iddemande in (select Iddmd from unite_dmde u where u.Idgestion is null and u.Autorisation='OUI')");
		
		listDmdEnCourtEtEtudi.add(new SelectItem(0," "));
		
		try {
			while(res.next())
			{listDmdEnCourtEtEtudi.add(new SelectItem(res.getInt("Iddemande"),""+res.getInt("Iddemande")+""));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listDmdEnCourtEtEtudi;
	}
	
	public void setListDmdEnCourtEtEtudi(List<SelectItem> listDmdEnCourtEtEtudi) {
		this.listDmdEnCourtEtEtudi = listDmdEnCourtEtEtudi;
	}
	public String getMotivation() {
		return motivation;
	}
	public void setMotivation(String motivation) {
		this.motivation = motivation;
	}
	public String getAutorisation() {
		return autorisation;
	}
	public void setAutorisation(String autorisation) {
		this.autorisation = autorisation;
	}
	
	public List<SelectItem> getListAutorisation() {
		if(listAutorisation==null)
			listAutorisation=new ArrayList<SelectItem>();
		else
			listAutorisation.clear();
		
		listAutorisation.add(new SelectItem(""));
		listAutorisation.add(new SelectItem("OUI"));
		listAutorisation.add(new SelectItem("NON"));
		
		return listAutorisation;
	}
	
	public void setListAutorisation(List<SelectItem> listAutorisation) {
		this.listAutorisation = listAutorisation;
	}
	public int getQuantiteMatAccord() {
		return quantiteMatAccord;
	}
	public void setQuantiteMatAccord(int quantiteMatAccord) {
		this.quantiteMatAccord = quantiteMatAccord;
	}
	public int getQuantiteDmd() {
		return quantiteDmd;
	}
	public void setQuantiteDmd(int quantiteDmd) {
		this.quantiteDmd = quantiteDmd;
	}
	public List<DemandeBean> getListDesMateriaux() {
		ResultSet res=null;
		res=Connecteur.Extrairedonnees("Select * from materiel");
		if(listDesMateriaux==null)
			listDesMateriaux=new ArrayList<DemandeBean>();
		else
			listDesMateriaux.clear();
		
		try {
			while(res.next())
			{DemandeBean m=new DemandeBean();
			m.designationMat=res.getString("Designation");
			m.quantiteMateriel=res.getInt("quantiteEnStocks");
			listDesMateriaux.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
		return listDesMateriaux;
	}
	public void setListDesMateriaux(List<DemandeBean> listDesMateriaux) {
		this.listDesMateriaux = listDesMateriaux;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public int getIdDmd() {
		return idDmd;
	}
	public void setIdDmd(int idDmd) {
		this.idDmd = idDmd;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<DemandeBean> getListDesProdDmd() {
		return listDesProdDmd;
	}
	public void setListDesProdDmd(List<DemandeBean> listDesProdDmd) {
		this.listDesProdDmd = listDesProdDmd;
	}
	public int getIdMateriel() {
		return idMateriel;
	}
	public void setIdMateriel(int idMateriel) {
		this.idMateriel = idMateriel;
	}
	public int getQuantiteMateriel() {
		return quantiteMateriel;
	}
	public void setQuantiteMateriel(int quantiteMateriel) {
		this.quantiteMateriel = quantiteMateriel;
	}

	public String getDesignationMat() {
		return designationMat;
	}
	public void setDesignationMat(String designationMat) {
		this.designationMat = designationMat;
	}
	public List<SelectItem> getListDesMatNonEvalueSeTrouvSurUneDmd() {
		ResultSet res=null;
		if(listDesMatNonEvalueSeTrouvSurUneDmd==null)
			listDesMatNonEvalueSeTrouvSurUneDmd=new ArrayList<SelectItem>();
		else
			listDesMatNonEvalueSeTrouvSurUneDmd.clear();
		
		res=Connecteur.Extrairedonnees("Select m.Idmateriel,m.Designation from unite_dmde u,materiel m where u.Iddmd="+this.idDmd+" and u.Idmateriel=m.Idmateriel and u.Idgerant is null");
		
		listDesMatNonEvalueSeTrouvSurUneDmd.add(new SelectItem(0," "));
		try {
			while(res.next())
			{
	listDesMatNonEvalueSeTrouvSurUneDmd.add(new SelectItem(res.getInt("Idmateriel"),res.getString("Designation")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listDesMatNonEvalueSeTrouvSurUneDmd;
	}
	
	
	
	public void setListDesMatNonEvalueSeTrouvSurUneDmd(
			List<SelectItem> listDesMatNonEvalueSeTrouvSurUneDmd) {
		this.listDesMatNonEvalueSeTrouvSurUneDmd = listDesMatNonEvalueSeTrouvSurUneDmd;
	}
	public List<SelectItem> getListDesDmdNonEtudiees() {
		ResultSet res=null;
		if(listDesDmdNonEtudiees==null)
			listDesDmdNonEtudiees=new ArrayList<SelectItem>();
		else
			listDesDmdNonEtudiees.clear();
		
		res=Connecteur.Extrairedonnees("Select * from demande where Etatdmd='NON ETUDIEE' or Etatdmd='ETUDE EN COURT'");
		
		listDesDmdNonEtudiees.add(new SelectItem(0," "));
		
		try {
			while(res.next())
			{listDesDmdNonEtudiees.add(new SelectItem(res.getInt("Iddemande"),""+res.getInt("Iddemande")+""));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listDesDmdNonEtudiees;
	}
	public void setListDesDmdNonEtudiees(List<SelectItem> listDesDmdNonEtudiees) {
		this.listDesDmdNonEtudiees = listDesDmdNonEtudiees;
	}
	
	
	//DEBUT DE LA FONCTION QUI AJOUTE DU MATERIEL SUR UNE COMMANDE
	public void ajouteMatSurCmd()
	{int j=0;

	System.out.println("Dans idMateriel "+idMateriel);
	System.out.println("Dans idMateriel "+idMateriel);
	if(this.idMateriel==0)
		{message="CHOISISSER LE MATERIEL S'IL VOUS PLAIT!!!";
		System.out.println("Dans idMateriel==0 "+idMateriel);
		return;
		}
	if(this.quantiteMateriel==0)
		{message="SAISISSER LA QUANTITE S'IL VOUS PLAIT!!!";
		System.out.println("LA QUANTITE EST 0");
		return;
		}	
	if(listDesProdDmd==null)
		listDesProdDmd=new ArrayList<DemandeBean>();
	System.out.println("Size  :"+listDesProdDmd.size());
	while((j<listDesProdDmd.size())&&(listDesProdDmd.get(j).idMateriel!=this.idMateriel))
	{j++;
		}

	if(j<listDesProdDmd.size())
	{listDesProdDmd.get(j).quantiteMateriel+=this.quantiteMateriel;
	return;
	}
	System.out.println("Size  :"+listDesProdDmd.size());

	ResultSet r=Connecteur.Extrairedonnees("Select * from materiel where Idmateriel="+this.idMateriel+"");
	DemandeBean i=new DemandeBean();

	i.idMateriel=this.idMateriel;
	i.quantiteMateriel=this.quantiteMateriel;

	try {
		r.next();
		i.designationMat=r.getString("Designation");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	listDesProdDmd.add(i);

	System.out.println("Size  :"+listDesProdDmd.size());
	}
	//FIN DE LA FONCTION QUI AJOUTE DU MATERIEL SUR UNE COMMANDE

	
	
	//DEBUT DE LA FONCTION QUI RECUPERE LE ID DU DERNIER ENREGISTREMENT DE LA TABLE COMMANDE
	public int recuperIDCmd()
	{
	int i=-1;
	ResultSet r=null;
	r=Connecteur.Extrairedonnees("SELECT Iddemande FROM demande order by Iddemande desc limit 1");
	if(r!=null)
		try {
			if(r.next()){
				i=r.getInt("Iddemande");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return i;
		}
	//FIN DE LA FONCTION QUI RECUPERE LE ID DU DERNIER ENREGISTREMENT DE LA TABLE PERSONNE


//DEBUT DE LA FONCTION QUI CREE UNE DEMANDE ET ENREGISTRE LES PRODUITS
//SE TROUVANT SUR CETTE COMMANDE.
	public void creerDmdMateriel()
	{int idDmd;
	if(listDesProdDmd.size()==0)	
		{message="LA COMMANDE EST VIDE!!!";
		return;
		}
	int i=-1;
	i=Connecteur.Insererdonnees("insert into demande (Idchefprod,Datedmd,Etatdmd) values (3,now(),'NON ETUDIEE')");

	if(i==-1)
	{message="CREATION DEMANDE ECHOUEE!!!";
	return;
		}
	idDmd=recuperIDCmd();
	int k;
	for(k=0;k<listDesProdDmd.size();k++)
	{System.out.println("Avant");
	i=Connecteur.Insererdonnees("insert into unite_dmde(Iddmd,Idmateriel,Qtitedmd,Autorisation) values ("+idDmd+","+listDesProdDmd.get(k).idMateriel+","+listDesProdDmd.get(k).quantiteMateriel+",'NON')");
	System.out.println("Apres");
	}

	if(i==-1)
	message="OPERATION DE DEMANDE DU MATERIEL ECHOUEE!!!";
	else
	message="OPERATION DE DEMANDE DU MATERIEL REUSSIE!!!";

	listDesProdDmd.clear();
	}
//FIN DE LA FONCTION QUI CREE UNE DEMANDE ET ENREGISTRE LES PRODUITS
//SE TROUVANT SUR CETTE COMMANDE.
	
	
	public void detailPersoPourUneDmd()
	{
		if(this.idDmd==0)
		{
			this.nom="";
			this.prenom="";
			return;
		}
		ResultSet res=null;
		res=Connecteur.Extrairedonnees("select * from personne p,chef_production c,demande d where d.Iddemande="+this.idDmd+" and d.Idchefprod=c.Idcheprod and c.Idcheprod=p.Idpersonne");
		
		try {
			if(res.next())
			{this.nom=res.getString("Nompersonne");
			this.prenom=res.getString("Prenompersonne");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.quantiteMateriel=0;
	}

	
	//DEBUT DE LA FONCTION QUI PERMET D'AUGMENTER LA QUANTITE D'UN 
	//MATERIEL DONNE EN STOCK.
	public void ajouteQuantiteMat()
	{int n=-1,quantit=0;
	ResultSet res=null;
	
	if(this.idMateriel==0)
	{message="SELECTIONNER LE MATERIEL S'IL VOUS PLAIT!!";
	return;
	}
	if(this.quantiteMateriel==0)
	{message="SAISISSER LA QUANTITE S'IL VOUS PLAIT!!";
	return;
	}
	
	res=Connecteur.Extrairedonnees("select * from materiel where Idmateriel="+this.idMateriel+"");
	
	try {
		res.next();
	quantit=res.getInt("quantiteEnStocks");

	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	this.quantiteMateriel+=quantit;
	n=Connecteur.Insererdonnees("update materiel set quantiteEnStocks="+this.quantiteMateriel+" where Idmateriel="+this.idMateriel+"");
	
	this.quantiteMateriel=0;
	if(n==-1)
		message="ECHEC D'INSERTION!!";
	else
		message="INSERTION REUSSIE!!";
	}
	//FIN DE LA FONCTION QUI PERMET D'AUGMENTER LA QUANTITE D'UN 
	//MATERIEL DONNE EN STOCK.
	
	
	
	public void detailsMaterielSurDmd()
	{ResultSet res=null;
	res=Connecteur.Extrairedonnees("select * from materiel where Idmateriel="+this.idMateriel+"");
	try {
		if(res.next())
		{
			this.quantiteMateriel=res.getInt("quantiteEnStocks");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	res=Connecteur.Extrairedonnees("select * from unite_dmde where Iddmd="+this.idDmd+" and Idmateriel="+this.idMateriel+"");
	try {
		res.next();
		this.quantiteDmd=res.getInt("Qtitedmd");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}
	
	
//DEBUT DE LA FONCTION QUI DIMINUE LA QUANTITE DU MATERIEL SE TROUVANT EN STOCK
//ELLE RETOURNE -1 EN CAS D'ECHEC
	public int diminueQteMatDansStock(int idMat,int qte)
	{ResultSet res=null;
	int qTotal=0,n=-1;
	res=Connecteur.Extrairedonnees("select * from materiel where Idmateriel="+idMat+"");
	try {
		res.next();
		qTotal=res.getInt("quantiteEnStocks");
		qTotal-=qte;
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	n=Connecteur.Insererdonnees("update materiel set quantiteEnStocks="+qTotal+" where Idmateriel="+idMat+"");
	return n;
	}
//FIN DE LA FONCTION QUI DIMINUE LA QUANTITE DU MATERIEL SE TROUVANT EN STOCK
	
	
	public void saveDecisionOnAskedMat()
	{int n=-1;
	ResultSet res=null;
	System.out.println("iiiiiiiii");
		if(this.idDmd==0)
		{System.out.println("i0i0i0i0i0i0i0i0i0");
			message="SELECTIONNER UNE DEMANDE S'IL VOUS PLAIT!!";
			return;
		}
		System.out.println("jjjjjjjjjj");
		if(this.idMateriel==0)
		{
			message="SELECTIONNER LE MATERIEL S'IL VOUS PLAIT!!";
			return;
		}
		
		System.out.println("this.autorisation"+this.autorisation);
		System.out.println("this.quantiteMatAccord"+this.quantiteMatAccord);
		
		if((this.quantiteMatAccord==0)&&(this.autorisation.equalsIgnoreCase("OUI")))
		{
			message="SAISISSER LA QUANTITE ACCORDEE S'IL VOUS PLAIT!!";
			return;
		}
		System.out.println("lllllllll");
		if(this.quantiteMateriel<this.quantiteMatAccord)
		{
			message="LA QUANTITE ACCORDEE N'EST PAS DISPONNIBLE!!";
			return;
		}
		System.out.println("mmmmmmmmm");
		if(this.autorisation.length()==0)
		{
			message="VOUS N'AVEZ NI AUTORISE,NI REFUSE LA SORTIE DE CE PRODUIT!!";
			return;
		}
		if((this.autorisation.equalsIgnoreCase("NON"))&&(this.motivation.length()==0))
		{
			message="JUSTIFIER LA DECISION S'IL VOUS PLAIT!!";
			return;
		}
		System.out.println("nnnnnnnnnn");
	n=Connecteur.Insererdonnees("update unite_dmde set Idgerant=9,Autorisation='"+this.autorisation+"',Motivation='"+this.motivation+"',Dateanalyse=now(),Qtiteaccorde="+this.quantiteMatAccord+" where Iddmd="+this.idDmd+" and Idmateriel="+this.idMateriel+"");
	System.out.println("ooooooooooo");
	if(n==-1)
	{message="INSERTION ECHOUEE!!";
	return;
	}

	res=Connecteur.Extrairedonnees("select * from demande where Etatdmd='NON ETUDIEE'");
	try {
		if(res.next())
		{n=-1;
		n=Connecteur.Insererdonnees("update demande set Etatdmd='ETUDE EN COURT' where Iddemande="+this.idDmd+"");
		}
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	n=diminueQteMatDansStock(this.idMateriel,this.quantiteMatAccord);
	if(n==-1)
	{message="INSERTION ECHOUEE!!";
	return;
	}
	
	res=Connecteur.Extrairedonnees("select * from unite_dmde where Iddmd="+this.idDmd+" and Idgerant is null");
	try {
		if(!res.next())
		{n=-1;
		n=Connecteur.Insererdonnees("update demande set Etatdmd='ETUDIEE' where Iddemande="+this.idDmd+"");	
		}
			
		message="OPERATION REUSSIE!!";
		
		this.autorisation="";
		this.quantiteMatAccord=0;
		this.motivation=null;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	
	//DEBUT DE LA FONCTION QUI RECCUPERE LA QUANTITE D'UN MATERIEL
	//ACCORDEE PAR LE GERANT
	public void extraireQteAccordee()
	{
		ResultSet res=null;
		res=Connecteur.Extrairedonnees("select * from unite_dmde where Iddmd="+this.idDmd+" and Idmateriel="+this.idMateriel+"");
		try {
			if(res.next())
			this.quantiteMatAccord=res.getInt("Qtiteaccorde");
			else
			this.quantiteMatAccord=0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//FIN DE LA FONCTION QUI RECCUPERE LA QUANTITE D'UN MATERIEL
	//ACCORDEE PAR LE GERANT
	
	//DEBUT DE LA FONCTION QUI ECOUTE LE CHANGEMENT DE LA DEMANDE
	public void ecouteChangeDmd()
	{
		this.quantiteMatAccord=0;
	}
	//FIN DE LA FONCTION QUI ECOUTE LE CHANGEMENT DE LA DEMANDE	
	
	
	//DEBUT DE LA FONCTION QUI MARQUE LA SORTIE DES MATERIAUX
	//DEMANDES
	public void marquerSortieMat()
	{	ResultSet res=null;
		int n=-1,m=-1;
		n=Connecteur.Insererdonnees("update unite_dmde set Idgestion=15 where Iddmd="+this.idDmd+" and Idmateriel="+this.idMateriel+"");
res=Connecteur.Extrairedonnees("select * from unite_dmde where Iddmd="+this.idDmd+" and Autorisation='OUI' and Idgestion is null");	
try {
	if(!res.next())
		{res=Connecteur.Extrairedonnees("select * from unite_dmde where Iddmd="+this.idDmd+" and Idgerant is null");
		if(!res.next())
			m=Connecteur.Insererdonnees("update demande set Etatdmd='TERMINEE' where Iddemande="+this.idDmd+"");
		}
	this.quantiteMatAccord=0;
		if(n==-1)
			message="OPERATION ECHOUEE!!";
		else
			message="OPERATION REUSSIE!!";
			
			
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	}
	//FIN DE LA FONCTION QUI MARQUE LA SORTIE DES MATERIAUX
	//DEMANDES
	
	
}
