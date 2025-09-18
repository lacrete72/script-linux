install_paquet(){
read -p "Entrez le nom du paquet à installer : " paquet
            if dpkg -s "$paquet" &> /dev/null; then
                echo "Le paquet '$paquet' est déjà installé."
            else
                apt install -y "$paquet"
                if [[ $? -eq 0 ]]; then
                    echo "Paquet '$paquet' installé avec succès."
                else
                    echo "Erreur lors de l'installation du paquet."
                fi
            fi
}
