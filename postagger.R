library(udpipe)

modelo <- udpipe_download_model(language = "portuguese")
modelo_caminho <- modelo$file_model
modelo_carregado <- udpipe_load_model(file = modelo_caminho)

marcador <- function(input){
  input_anotado <- udpipe_annotate(modelo_carregado, input)
  marcadores <- as.data.frame(input_anotado)[, c("token","upos")]
  return(marcadores)
}

palavra <- readline(prompt = "Escreva uma palavra: ")
marcadores <- marcador(palavra)

cat(paste("Classe de palavra de", palavra, ":", marcadores$upos[1],"\n"))
