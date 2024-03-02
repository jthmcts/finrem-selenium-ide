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

echo -n "Enter respondent's first name (default: John): "
read -r respondentFirstName
if [[ $respondentFirstName = "" ]]; then respondentFirstName="John"; fi

echo -n "Enter respondent's last name (default: Smith): "
read -r respondentLastName
if [[ $respondentLastName = "" ]]; then respondentLastName="Smith"; fi

echo -n "Enter respondent's postcode (default: NW5 1UN): "
read -r respondentPostcode
if [[ $respondentPostcode = "" ]]; then respondentPostcode="NW5 1UN"; fi

echo -n "Enter divorce evidence upload PDF file including full path: "
read -r divorceEvidenceUploadFile

dir=$(dirname "$0")

cp "$dir"/templates/financial-remedy-template ./financial-remedy.side

sed -i '' -e "s/{{applicant-solicitor-name}}/$applicantSolicitorName/g" financial-remedy.side
sed -i '' -e "s/{{applicant-solicitor-organisation}}/$applicantSolicitorOrganisation/" financial-remedy.side
sed -i '' -e "s/{{applicant-solicitor-email}}/$applicantSolicitorEmail/" financial-remedy.side
sed -i '' -e "s/{{applicant-first-name}}/$applicantFirstName/" financial-remedy.side
sed -i '' -e "s/{{applicant-last-name}}/$applicantLastName/" financial-remedy.side
sed -i '' -e "s/{{applicant-postcode}}/$applicantPostcode/" financial-remedy.side

sed -i '' -e "s/{{respondent-solicitor-name}}/$respondentSolicitorName/" financial-remedy.side
sed -i '' -e "s/{{respondent-solicitor-organisation}}/$respondentSolicitorOrganisation/" financial-remedy.side
sed -i '' -e "s/{{respondent-solicitor-email}}/$respondentSolicitorEmail/" financial-remedy.side
sed -i '' -e "s/{{respondent-first-name}}/$respondentFirstName/" financial-remedy.side
sed -i '' -e "s/{{respondent-last-name}}/$respondentLastName/" financial-remedy.side
sed -i '' -e "s/{{respondent-postcode}}/$respondentPostcode/" financial-remedy.side

sed -i '' -e "s~{{divorce-evidence-upload-file}}~$divorceEvidenceUploadFile~" financial-remedy.side
