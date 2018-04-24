clear
line=1
git diff --name-only origin/develop..HEAD
files2Push="$(git diff --name-only origin/develop..HEAD)"
echo "Contenido: $files2Push"

while IFS= read -r line
do
   echo "linea: $line"
done < <(printf '%s\n' "$files2Push")


# while IFS= read -r value; do
#  echo "LINE $line : value $value"
#  (( line ++ ))
# done < files2Push
