<?xml version="1.0" encoding="utf-8" ?>



<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- NOEUD MASTER -->
	<xsl:template match="master">

		<!-- LISTE ENSEIGNEMENTS -->
		<xsl:document href="www/parcours/listeEnseignements.html">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    			<html xmlns="http://www.w3.org/1999/xhtml">
				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
					<link rel="stylesheet" type="text/css" href="../../CSS/master.css" />
					<title>
						Liste Enseignements
					</title>
				</head>
				<body>
					<div class="header">
						<img alt ="image"  src="../../CSS/CONTENTS/logo.png"></img>
						<h1>MASTER INFORMATIQUE DE MARSELLE</h1>
					</div>
					<div class="navigation">
						<xsl:call-template name="menu">
							<!-- Nous sommes a la racine -->
							<xsl:with-param name="link" />
						</xsl:call-template>
					</div>
					<div class="body">
						<div class="titre">
							Les unites triees par code
						</div>
						<div class="contenu">
						<xsl:for-each select="//enseignement">
							<a href="../enseignements/{@idEnseignement}.html">
								[
								<xsl:value-of select="@idEnseignement" />
								]
							</a>
						</xsl:for-each>
					</div>
						<div class="titre">
							Les unites du master
						</div>
						<div class="contenu">
						<table>
							<tr>
								<td>Code</td>
								<td>Nom</td>
							</tr>
							<xsl:for-each select="//enseignement">
								<tr>
									<td>
										<a href="../enseignements/{@idEnseignement}.html">
											<xsl:value-of select="@idEnseignement" />
										</a>
									</td>
									<td>
										<a>
											<xsl:value-of select="nom" />
										</a>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</div>
					</div>
				</body>
			</html>
		</xsl:document>

		<!-- LISTE INTERVENANTS -->
		<xsl:document href="www/parcours/listeIntervenants.html">
			     <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
			<html xmlns="http://www.w3.org/1999/xhtml">
				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
					<link rel="stylesheet" type="text/css" href="../../CSS/master.css" />
					<title>Liste des Intervenants						</title>
				</head>
				<body>
					<div class="header">
						<img alt ="image" src="../../CSS/CONTENTS/logo.png"></img>
						<h1>MASTER INFORMATIQUE DE MARSELLE</h1>
					</div>
					<div class="navigation">
						<xsl:call-template name="menu">
							<xsl:with-param name="link" />
						</xsl:call-template> 
					</div>
					<center>
						<h1>Liste des Intervenants du master</h1>
					</center>
					<div class="body">
						<div class="titre">Une premiere liste</div>
						<div class="contenu">
						<p>L'equipe pedagogique est en cours de constitution. Cette liste
							sera completee en mars et avril 2012.
						</p>
						<table>
							<tr>
								<td>Nom</td>
								<td>Telephone</td>
								<td>Courriel</td>
								<td>Etablissement</td>
							</tr>
							<xsl:for-each select="//intervenant">
								<tr>
									<td>
										<a href="../intervenants/{@idIntervenant}.html">
											<xsl:value-of select="nom" />
										</a>
									</td>
									<td>
										<xsl:value-of select="telephone" />
									</td>
									<td>
										<xsl:value-of select="mail" />
									</td>
									<td>
										<xsl:value-of select="etablissement" />
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</div>
					</div>
				</body>
			</html>
		</xsl:document>



		<!-- Generation intervenants HTML -->
		<xsl:for-each select="//intervenant">
			<xsl:document href="www/intervenants/{@idIntervenant}.html">
				     <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
				<html xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
						<link rel="stylesheet" type="text/css" href="../../CSS/master.css" />
						<title>
							<xsl:value-of select="nom" />
						</title>
					</head>
					<body>
						<div class="header">
							<img alt ="image"  src="../../CSS/CONTENTS/logo.png"></img>
							<h1>MASTER INFORMATIQUE DE MARSELLE</h1>
						</div>
						<xsl:apply-templates select="." />
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>

		<!-- Generation Page specialite -->
		<xsl:for-each select="//specialite">
			<xsl:document href="www/parcours/specialites/{@idSpecialite}.html">
				     <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
				 <html xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
						<link rel="stylesheet" type="text/css" href="../../../CSS/master.css" />
						<title>
							<xsl:value-of select="nom" />
						</title>
					</head>
					<body>
						<div class="header">
							<img alt ="image"  src="../../../CSS/CONTENTS/logo.png"></img>
							<h1>MASTER INFORMATIQUE DE MARSELLE</h1>
						</div>
						<div class="navigation">
							<xsl:call-template name="menu">
								<xsl:with-param name="link">../</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="body">
							<xsl:apply-templates select="." />
						</div>
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>

		<!-- Generation enseignements HTML -->
		<xsl:for-each select="//enseignement">
			<xsl:document href="www/enseignements/{@idEnseignement}.html">
				     <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
				 <html xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<link rel="stylesheet" type="text/css" href="../../CSS/master.css" />
						<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
						<title>
							<xsl:value-of select="nom" />
						</title>
					</head>
					<body>
						<div class="header">
							<img alt ="image"  src="../../CSS/CONTENTS/logo.png"></img>
							<h1>MASTER INFORMATIQUE DE MARSELLE</h1>
						</div>
							<xsl:apply-templates select="." />
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>

		<!-- Generation parcours HTML -->
		<xsl:for-each select="//parcour">
			<xsl:document href="www/parcours/{@idParcour}.html">
				     <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
				 <html xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<link rel="stylesheet" type="text/css" href="../../CSS/master.css" />
						<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
						<title>
							<xsl:value-of select="nom" />
						</title>
					</head>
					<body>
						<div class="header">
							<img alt ="image"  src="../../CSS/CONTENTS/logo.png"></img>
							<h1>MASTER INFORMATIQUE DE MARSELLE</h1>
						</div>
						<div class="navigation">
							<xsl:call-template name="menu">
								<xsl:with-param name="link" />
							</xsl:call-template>
						</div>
						<div class="body">
							<div class="titre">
								<xsl:value-of select="nom" />
							</div>
							<div class="contenu">
								Responsables :
							<xsl:for-each select="ref-specialite">
								<xsl:variable name="ref" select="@ref" />
								<ul>
									<xsl:for-each select="//specialite">
										<!--On peut aussi mettre la condition en XPATH dans le select-->
										<xsl:if test="$ref = @idSpecialite">
											<xsl:apply-templates select="responsable/ref-intervenant" />
										</xsl:if>
									</xsl:for-each>
								</ul>
							</xsl:for-each>
							<xsl:value-of select="description" />
							<br />
							<xsl:for-each select="ref-specialite">
								<xsl:variable name="ref" select="@ref" />
								<ul>
									<xsl:for-each select="//specialite">
										<xsl:if test="$ref = @idSpecialite">
											<li>
												<a href="specialites/{$ref}.html">
													<xsl:value-of select="nom" />
												</a>
											</li>
										</xsl:if>
									</xsl:for-each>
								</ul>
							</xsl:for-each>
						</div>
						</div>
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>

		<!-- Squelette de l' index HTML -->
		     <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		 <html>
			<head>
				<link rel="stylesheet" type="text/css" href="../CSS/master.css" />
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title>Master Luminy</title>
			</head>
			<body>
				<div class="header">
					<img src="../CSS/CONTENTS/logo.png" alt="logo"></img>
					<h1>MASTER INFORMATIQUE DE MARSELLE</h1>
				</div>
				<div class="navigation">
					<xsl:call-template name="menu">
						<xsl:with-param name="link">parcours/</xsl:with-param>
					</xsl:call-template>
				</div>
				<div class="body">
					<xsl:value-of select="description" />
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- FIN NOEUD MASTER -->

	<!-- NOEUD PARCOURS -->
	<!-- Generation du menu -->
	<xsl:template name="menu">
		<xsl:param name="link" />
		<ul>
			<li>
				<strong>PARCOURS</strong>
			</li>

			<xsl:for-each select="//parcour">
				<!-- Plus d'une specialite -->

				<xsl:if test="count(ref-specialite) > 1 ">
					<li>
						<a href="{$link}{@idParcour}.html">
							<strong>
								<xsl:value-of select="nom" />
							</strong>
						</a>
						<xsl:for-each select="ref-specialite">
							<xsl:call-template name="genererSpecialite">
								<xsl:with-param name="link">
									<xsl:value-of select="$link" />
								</xsl:with-param>
								<xsl:with-param name="ref">
									<xsl:value-of select="@ref" />
								</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
					</li>
				</xsl:if>
				<!-- Une seule specialite -->
				<xsl:if test="count(ref-specialite) = 1 ">
					<li>
						<a href="{$link}specialites/{ref-specialite/@ref}.html">
							<strong>
								<xsl:value-of select="nom" />
							</strong>
						</a>
					</li>
				</xsl:if>
			</xsl:for-each>
			<li>
				<a href="{$link}listeEnseignements.html">
					<strong>
						Unites
					</strong>
				</a>
			</li>
			<li>
				<a href="{$link}listeIntervenants.html">
					<strong>
						Intervenants
					</strong>
				</a>
			</li>
		</ul>
	</xsl:template>

	<!-- Generer specialites -->
	<xsl:template name="genererSpecialite">
		<xsl:param name="link" />
		<xsl:param name="ref" />
		<ul>
			<li>
				<a href="{$link}specialites/{$ref}.html">
					<xsl:value-of select="//specialite[@idSpecialite = $ref]/nom" />
				</a>
			</li>
		</ul>
	</xsl:template>

	<!-- NOEUD ref-intervenant -->
	<xsl:template match="ref-intervenant">
		<xsl:variable name="ref" select="@ref" />
		<xsl:for-each select="//intervenant">
			<!-- Test condition sans XPTATH -->
			<xsl:if test="$ref = @idIntervenant">
				<li>
					<a href="../intervenants/{$ref}.html">
						<xsl:value-of select="nom" />
					</a>
				</li>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- FIN NOEUD ref-intervenant -->

	<!-- FIN NOEUD REF SEPCIALITE -->

	<!-- NOEUD SEMESTRES -->
	<xsl:template match="semestres">
		<ul>
			<xsl:for-each select="semestre">
				<li>
					Semestre :
					<xsl:value-of select="@idSemestre" />
				</li>
				<xsl:for-each select="blocks/block">
					<h2>
						<xsl:value-of select="@titre" />
						<xsl:value-of select="@etat" />
					</h2>
					<ul>
						<xsl:for-each select="ref-enseignement">
							<xsl:variable name="ref" select="@ref" />
							<li>
								<a href="../enseignements/{@ref}.html">
									<xsl:value-of select="//enseignement[@idEnseignement = $ref]/nom" />
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</xsl:for-each>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<!-- NOEUD INTERVENANT -->
	<xsl:template match="intervenant">
		<div id="{@idIntervenant}">


			<div class="body">			
					<div class="titre">
					<xsl:value-of select="nom" />
				</div>
			<div class ="contenu">
				<ul>
					<li>
						Identifiant :
						<xsl:value-of select="identifiant" />
					</li>
					<li>
						Adresse Mail
						<xsl:value-of select="mail" />
					</li>
					<li>
						Telephone :
						<xsl:value-of select="telephone" />
					</li>
					<li>
						Etablissement :
						<xsl:value-of select="etablissement" />
					</li>
				</ul>
			</div>
			<br/>
						<center>
							<a href="#" onclick="javascript:history.back();">Revenir a la liste</a>
						</center>
		</div>
	</div>
	</xsl:template>

	<!-- NOEUD ENSEIGNEMENT -->
	<xsl:template match="enseignement">
		<div id="{@idEnseignement}">
			<div class="body">
				<div class="titre">
				<xsl:value-of select="nom" />
			</div>
			<div class="contenu">
			<ul>
				<li>
					Identifiant :
					<xsl:value-of select="identifiant" />
				</li>
				<li>
					Nombre de credits
					<xsl:value-of select="nombreCredit" />
				</li>
				<li>
					Resume :
					<xsl:value-of select="resume" />
				</li>
				<xsl:if test="pre-requis">
					<li>
						Prerequis :
						<xsl:value-of select="pre-requis" />
					</li>
				</xsl:if>


			</ul>

		</div>
						<br/>
						<center>
							<a href="#" onclick="javascript:history.back();">Revenir a la liste</a>
						</center>
		</div>
		</div>
	</xsl:template>


	<!-- Semestre -->
	<xsl:template name="genererSemestre">
		<xsl:param name="idSemestre" />
		Programme du S<xsl:value-of select="//semestre[@idSemestre = $idSemestre]/titre" />
		<xsl:for-each select="//semestre[@idSemestre = $idSemestre]/ref-block">
			<xsl:variable name="idBlock" select="@ref" />
			<li>
				<xsl:value-of select="//block[$idBlock = @idBlock]/@titre" />
			</li>
			<xsl:for-each select="//block[$idBlock = @idBlock]">
				<xsl:for-each select="ref-enseignement">
					<xsl:variable name="idEnse" select="@ref" />
					<xsl:call-template name="afficherNomEnseignement">
						<xsl:with-param name="idEnseignement">
							<xsl:value-of select="$idEnse" />
						</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<!-- Afficher nom enseignement -->

	<xsl:template name="afficherNomEnseignement">
		<xsl:param name="idEnseignement" />
		<li>
			<a href="../../enseignements/{$idEnseignement}.html">
				<xsl:value-of
					select="//enseignement[@idEnseignement = $idEnseignement]/nom" />
				(
				<xsl:value-of
					select="//enseignement[@idEnseignement = $idEnseignement]/nombreCredit" />
				credits)
			</a>
		</li>
	</xsl:template>

	<!-- PAGE SPECIALITE -->
	<xsl:template match="specialite">
		<xsl:if test="nom != ''">
			<div class="titre">
				Nom
			</div>
			<div class="contenu">
				<xsl:value-of select="nom" />
			</div>
		</xsl:if>
		<xsl:variable name="ref" select="responsable/ref-intervenant/@ref" />
		<div class="titre">
			Responsable
		</div>
		<div class="contenu">
			<xsl:value-of select="//intervenant[@idIntervenant = $ref]/nom" />
		</div>
		<xsl:if test="etablissement != ''">
			<div class="titre">
				Lieu d'enseignement</div>
			<div class="contenu">
				<xsl:value-of select="etablissement" />
			</div>
		</xsl:if>
		<xsl:if test="description != ''">
			<div class="titre">
				Description
			</div>
			<div class="contenu">
				<xsl:value-of select="description" />
			</div>
		</xsl:if>
		<xsl:if test="competences != ''">
			<div class="titre">
				Competences a acquerir</div>
			<div class="contenu">
				<xsl:value-of select="competences" />
			</div>
		</xsl:if>
		<xsl:if test="connaissances != ''">
			<div class="titre">
				Connaissances a acquerir</div>
			<div class="contenu">
				<xsl:value-of select="connaissances" />
			</div>
		</xsl:if>
		<div class="titre">Programme et enseignements </div>
		<div class="contenu">
			<xsl:for-each select="ref-semestre">
				<xsl:variable name="idSemestre" select="@ref" />
				<xsl:call-template name="genererSemestre">
					<xsl:with-param name="idSemestre">
						<xsl:value-of select="$idSemestre" />
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
		</div>
		<xsl:if test="politiqueDesStages != ''">
			<div class="titre">
				Politique des stages
			</div>
			<div class="contenu">
				<xsl:value-of select="politiqueDesStages" />
			</div>
		</xsl:if>
		<xsl:if test="aspects != ''">
			<div class="titre">
				Aspects formation et recherche
			</div>
			<div class="contenu">
				<xsl:value-of select="aspects" />
			</div>
		</xsl:if>
		<xsl:if test="modalites != ''">
			<div class="titre">
				Modalite et recherche
			</div>
			<div class="contenu">
				<xsl:value-of select="modalites" />
			</div>
		</xsl:if>
		<xsl:if test="conditionAdmission != ''">
			<div class="titre">
				Condition d'admission et pre-requis
			</div>
			<div class="contenu">
				<xsl:value-of select="conditionAdmission" />
			</div>
		</xsl:if>
		<xsl:if test="debouches != ''">
			<div class="titre">
				Debouches
			</div>
			<div class="contenu">
				<xsl:value-of select="debouches" />
			</div>
		</xsl:if>
		<xsl:if test="poursuitesEtudes != ''">
			<div class="titre">
				Poursuites d'etudes
			</div>
			<div class="contenu">
				<xsl:value-of select="poursuitesEtudes" />
			</div>
		</xsl:if>
		<div class="contenu">
			<xsl:value-of select="autre" />
		</div>
	</xsl:template>

</xsl:stylesheet>
