menu_ip(){
#!/bin/bash
source ./ip_fixe.sh
source ./dhcp.sh

while true; do
    clear
    echo -e "${YELLOW}===== MENU ====="
    echo -e "${GREEN}1) assigner IP"
    echo -e "${GREEN}2) mettre en DHCP"
    echo -e "${GREEN}3) Quitter"
    echo -e "${YELLOW}================${NC}"
    read -p "Choisissez une option [1-4] : " choix

    case $choix in
        1)
            ip_fixe
            read -p "Appuyez sur Entrée pour continuer..." ;;
        2)
            dhcp
            read -p "Appuyez sur Entrée pour continuer..." ;;
        3)
            echo "Au revoir !"
            exit 0 ;;
        *)
            echo "Option invalide."
            read -p "Appuyez sur Entrée pour continuer..." ;;
    esac
done

}
