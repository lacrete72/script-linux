menu_ip(){
while true; do
    clear
    echo -e "${YELLOW}===== MENU ====="
    echo -e "${GREEN}1) assigner IP"
    echo -e "${GREEN}2) Menu paquet"
    echo -e "${GREEN}3) Menu IP"
    echo -e "${GREEN}4) Quitter"
    echo -e "${YELLOW}================${NC}"
    read -p "Choisissez une option [1-4] : " choix

    case $choix in
        1)
            ip_fixe
            read -p "Appuyez sur Entrée pour continuer..." ;;
        2)
            menu_paquet
            read -p "Appuyez sur Entrée pour continuer..." ;;
        3)
            menu_ip
            read -p "Appuyez sur Entrée pour continuer..." ;;
        4)
            echo "Au revoir !"
            exit 0 ;;
        *)
            echo "Option invalide."
            read -p "Appuyez sur Entrée pour continuer..." ;;
    esac
done

}
