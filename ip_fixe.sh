#!/bin/bash

# Vérifie si le script est exécuté en tant que root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED} Ce script doit être exécuté avec les droits root (sudo).${NC}"
    exit 1
fi

# Obtenir la liste des interfaces réseau (hors lo)
interfaces=($(ip -o link show | awk -F': ' '{print $2}' | grep -v lo))

# Affiche les interfaces disponibles
echo "Interfaces réseau détectées :"
for i in "${!interfaces[@]}"; do
    echo "$((i+1))) ${interfaces[$i]}"
done

# Demande à l'utilisateur de choisir une interface
read -p "Sélectionnez une interface (1-${#interfaces[@]}) : " choix
if ! [[ "$choix" =~ ^[1-9][0-9]*$ ]] || (( choix < 1 || choix > ${#interfaces[@]} )); then
    echo -e "${RED} Choix invalide.${NC}"
    exit 1
fi

interface=${interfaces[$((choix-1))]}
echo "Interface sélectionnée : $interface"

# Demande l'adresse IP
read -p "Adresse IP (ex: 192.168.1.100) : " ip

# Demande le masque de sous-réseau
read -p "Masque de sous-réseau (ex: 255.255.255.0) : " netmask

# Demande la passerelle
read -p "Passerelle (ex: 192.168.1.1) : " gateway

# Sauvegarde l'ancien fichier
cp /etc/network/interfaces /etc/network/interfaces.bak

# Écriture de la nouvelle configuration
cat > /etc/network/interfaces <<EOF
# Fichier généré automatiquement
auto lo
iface lo inet loopback

auto $interface
iface $interface inet static
    address $ip
    netmask $netmask
    gateway $gateway
EOF

echo "✅ Configuration appliquée à $interface"
echo "📁 Sauvegarde créée : /etc/network/interfaces.bak"

# Demande de redémarrage
read -p "Redémarrer le réseau maintenant ? (y/n) : " restart
if [[ "$restart" =~ ^[Yy]$ ]]; then
    systemctl restart networking
    echo "🔁 Service réseau redémarré."
else
    echo "ℹ️ Redémarrage manuel requis pour appliquer la configuration."
fi

