#!/bin/bash

echo -n "Enter applicant solicitor's name (default: Lionel Hutz): "
read -r applicantSolicitorName
if [[ $applicantSolicitorName = "" ]]; then applicantSolicitorName="Lionel Hutz"; fi

echo -n "Enter applicant solicitor's organisation (default: FinRem-1-Org): "
read -r applicantSolicitorOrganisation
if [[ $applicantSolicitorOrganisation = "" ]]; then applicantSolicitorOrganisation="FinRem-1-Org"; fi

echo -n "Enter applicant solicitor's email (default: fr_applicant_solicitor1@mailinator.com): "
read -r applicantSolicitorEmail
if [[ $applicantSolicitorEmail = "" ]]; then applicantSolicitorEmail="fr_applicant_solicitor1@mailinator.com"; fi

echo -n "Enter applicant's first name (default: Jane): "
read -r applicantFirstName
if [[ $applicantFirstName = "" ]]; then applicantFirstName="Jane"; fi

echo -n "Enter applicant's last name (default: Smith): "
read -r applicantLastName
if [[ $applicantLastName = "" ]]; then applicantLastName="Smith"; fi

echo -n "Enter applicant's postcode (default: NW5 1UN): "
read -r applicantPostcode
if [[ $applicantPostcode = "" ]]; then applicantPostcode="NW5 1UN"; fi

echo -n "Enter respondent solicitor name (default: Daniel Kaffee): "
read -r respondentSolicitorName
if [[ $respondentSolicitorName = "" ]]; then respondentSolicitorName="Daniel Kaffee"; fi

echo -n "Enter respondent solicitor's organisation (default: FinRem-2-Org): "
read -r respondentSolicitorOrganisation
if [[ $respondentSolicitorOrganisation = "" ]]; then respondentSolicitorOrganisation="FinRem-2-Org"; fi

echo -n "Enter respondent solicitor's email (default: fr_respondent_solicitor1@mailinator.com): "
read -r respondentSolicitorEmail
if [[ $respondentSolicitorEmail = "" ]]; then respondentSolicitorEmail="fr_respondent_solicitor1@mailinator.com"; fi

echo -n "Enter respondent's solicitor postcode (default: NW5 1UN): "
read -r respondentSolicitorPostcode
if [[ $respondentSolicitorPostcode = "" ]]; then respondentSolicitorPostcode="NW5 1UN"; fi

echo -n "Enter respondent's first name (default: John): "
read -r respondentFirstName
if [[ $respondentFirstName = "" ]]; then respondentFirstName="John"; fi

echo -n "Enter respondent's last name (default: Smith): "
read -r respondentLastName
if [[ $respondentLastName = "" ]]; then respondentLastName="Smith"; fi

echo -n "Enter divorce evidence upload file including full path (default: $HOME/Documents/test.pdf): "
read -r divorceEvidenceUploadFile
if [[ $divorceEvidenceUploadFile = "" ]]; then divorceEvidenceUploadFile="$HOME/Documents/test.pdf"; fi

echo "Select applicant's local court:"
echo "1: Birmingham Civil and Family Justice Centre"
echo "2: Liverpool Civil and Family Court"
echo "3: Mold County"
echo "4: Carlisle Combined Court"
echo -n "Enter selection (default: 1) [1..4] "
read -r courtSelection

if [[ -z $courtSelection || $courtSelection = 1 ]]; then
  region="Midlands"
  frcId="midlandsFRCList"
  frc="Birmingham FRC"
  courtId="birminghamCourtList"
  court="BIRMINGHAM CIVIL AND FAMILY JUSTICE CENTRE"
fi

if [[ $courtSelection = 2 ]]; then
  region="North West"
  frcId="northWestFRCList"
  frc="Liverpool FRC"
  courtId="liverpoolCourtList"
  court="LIVERPOOL CIVIL AND FAMILY COURT"
fi

if [[ $courtSelection = 3 ]]; then
  region="Wales"
  frcId="walesFRCList"
  frc="North Wales FRC"
  courtId="northWalesCourtList"
  court="Mold County"
fi

if [[ $courtSelection = 4 ]]; then
  region="North West"
  frcId="northWestFRCList"
  frc="Lancashire and Cumbria FRC"
  courtId="lancashireCourtList"
  court="CARLISLE COMBINED COURT"
fi

echo -n "Enter file to create (default: financial-remedy.side): "
read -r filename
if [[ $filename = "" ]]; then filename="financial-remedy.side"; fi

dir=$(dirname "$0")

cp "$dir"/template ./"$filename"

sed -i '' -e "s/{{applicant-solicitor-name}}/$applicantSolicitorName/g" "$filename"
sed -i '' -e "s/{{applicant-solicitor-organisation}}/$applicantSolicitorOrganisation/" "$filename"
sed -i '' -e "s/{{applicant-solicitor-email}}/$applicantSolicitorEmail/" "$filename"
sed -i '' -e "s/{{applicant-first-name}}/$applicantFirstName/" "$filename"
sed -i '' -e "s/{{applicant-last-name}}/$applicantLastName/" "$filename"
sed -i '' -e "s/{{applicant-postcode}}/$applicantPostcode/" "$filename"

sed -i '' -e "s/{{respondent-solicitor-name}}/$respondentSolicitorName/" "$filename"
sed -i '' -e "s/{{respondent-solicitor-organisation}}/$respondentSolicitorOrganisation/" "$filename"
sed -i '' -e "s/{{respondent-solicitor-email}}/$respondentSolicitorEmail/" "$filename"
sed -i '' -e "s/{{respondent-solicitor-postcode}}/$respondentSolicitorPostcode/" "$filename"
sed -i '' -e "s/{{respondent-first-name}}/$respondentFirstName/" "$filename"
sed -i '' -e "s/{{respondent-last-name}}/$respondentLastName/" "$filename"

sed -i '' -e "s~{{divorce-evidence-upload-file}}~$divorceEvidenceUploadFile~" "$filename"

sed -i '' -e "s/{{local-court-region}}/$region/" "$filename"
sed -i '' -e "s/{{local-court-frc-id}}/$frcId/" "$filename"
sed -i '' -e "s/{{local-court-frc}}/$frc/" "$filename"
sed -i '' -e "s/{{local-court-id}}/$courtId/" "$filename"
sed -i '' -e "s/{{local-court}}/$court/" "$filename"
