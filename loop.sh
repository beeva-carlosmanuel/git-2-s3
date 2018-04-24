clear
line=1
git diff --name-only origin/develop..HEAD
files2Push="$(git diff --name-only origin/develop..HEAD)"
tab='\t'
echo "Contenido: "
echo $tab."$files2Push"

while IFS= read -r line
do
   echo "linea: $line"
done < <(printf '%s\n' "$files2Push")
