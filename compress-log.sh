while true; do
  echo " "
  echo "-----[ Para arquivos na raiz (/), o script deve ser inicializado com sudo ]-----"
  echo "-----[ Pressione CTRL + C para encerrar a aplicação ]-----"
  echo "Digite o nome do diretório do log que deseja comprimir:"
  read LOG_DIR
  echo "Onde deseja salvar?"
  read STORAGE_FILES

  if [ -n LOG_DIR ]; then

    if ! [ -d $STORAGE_FILES ]; then
      echo "Criação do arquivo ${STORAGE_FILES} para armazenar os logs"
      mkdir $STORAGE_FILES
      chown $USER:$USER archived
    fi
    COMPRESSED_FOLDER_NAME="${STORAGE_FILES}/${LOG_DIR}_$(date +"%Y-%m-%d_%H-%M-%S").tar.gz"
    tar -czf $COMPRESSED_FOLDER_NAME $LOG_DIR
    echo "Arquivo comprimido com sucesso em: ${COMPRESSED_FOLDER_NAME}"

    echo "Deseja deletar o diretorio original? (s/N)"
    read DELETE_ORIGINAL_DIRECTORY

    if ! [[ "$DELETE_ORIGINAL_DIRECTORY" = "n" || "$DELETE_ORIGINAL_DIRECTORY" = "N" ]]; then
      rm -rf "$LOG_DIR"
    fi

  else
    clear
    echo "O diretório não pode estar vazio"
  fi
done
