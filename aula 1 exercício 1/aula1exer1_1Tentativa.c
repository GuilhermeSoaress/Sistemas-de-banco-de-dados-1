#include <stdio.h>
#define MAX_NOME 100
int qtdPessoas=0;
int qtdCarros=0;

struct strcarro{
    char ano[30];
    char placa[30];
    char marca[30];
    char modelo[30];
};

struct strpessoa{
    char nome[30];
    char CPF[12]; 
};

void cadastrarPessoas(){
    
    FILE *cadastraPessoa;

    struct strpessoa Pessoa;
    
        printf("Digite o nome da pessoa:\n");
        scanf("%s", Pessoa.nome);
        printf("Digite o CPF:\n");
        scanf("%s", Pessoa.CPF);

    cadastraPessoa = fopen("cadastro.bin", "ab");

    //fwrite(&Pessoa, 1, sizeof(struct Pessoa), cadastraPessoa);
    fwrite(&Pessoa, 1, sizeof(struct strpessoa), cadastraPessoa);
    fseek(cadastraPessoa, 1, SEEK_SET);
    fclose(cadastraPessoa);

    qtdPessoas++;
}

void cadastrarVeiculos(){

    int quantVeiculos;

    FILE *cadastraVeiculo;

    struct strcarro Carro;

    printf("Digite a quantidade de veiculos que deseja cadastrar:\n");
    scanf("%d", &quantVeiculos);
    
    for(int i = 1; i<=quantVeiculos; i++){
        printf("Digite o ano do veiculo %d:\n", i);
        scanf("%s", Carro.ano);
        printf("Digite a placa do veiculo %d:\n", i);
        scanf("%s", Carro.placa);
        printf("Digite a marca do veiculo %d:\n", i);
        scanf("%s", Carro.marca);
        printf("Digite o modelo do veiculo %d:\n", i);
        scanf("%s", Carro.modelo);

    }

    cadastraVeiculo = fopen("cadastro.bin", "ab");

    //fwrite(&Pessoa, 1, sizeof(struct Pessoa), cadastraPessoa);
    fwrite(&Carro, 1, sizeof(struct strcarro), cadastraVeiculo);
    fseek(cadastraVeiculo, 1, SEEK_SET);
    fclose(cadastraVeiculo);
    qtdCarros++;
}

void listarPessoas() {
    
    FILE *listaPessoas;

    struct strpessoa Pessoa;

   
    listaPessoas = fopen("cadastro.bin", "rb");
    
    for(int i=0; i<qtdPessoas; i++){
        // fread(&Pessoa, sizeof(struct strpessoa), 1, listaPessoas);
        //     printf("\nNome: %s\n", Pessoa.nome);
        //     printf("CPF: %s\n", Pessoa.CPF);
        while(fgets(Pessoa.nome, 30, listaPessoas) != NULL){
            printf("%s\n", Pessoa.nome);
        }
    }

    fclose(listaPessoas);
    printf("\n");
}

void listarCarros() {
    
    FILE *listaCarros;

    struct strcarro Carro;
   
    listaCarros = fopen("cadastro.bin", "rb");
    
    for(int i=0; i<qtdCarros; i++){
        fread(&Carro, sizeof(struct strcarro), 1, listaCarros);
            printf("\nano: %s\n", Carro.ano);
            printf("placa: %s\n", Carro.placa);
            printf("marca: %s\n", Carro.marca);
            printf("modelo: %s\n", Carro.modelo);
    }

    fclose(listaCarros);
    printf("\n");
}

int main(){
    int opcao;
    printf("---Cadastro de veículos---\n");

    do{
        printf("Escolher opcao:\n1 -> cadastrar pessoa\n2 -> cadastrar carros\n3 -> listar pessoa\n4 -> listar carros\n0 -> sair\n");
        scanf("%d", &opcao);
        getchar();

        switch (opcao){
            case 0:
                printf("saindo");
                break;
            case 1:
                cadastrarPessoas();
                break;

            case 2:
                cadastrarVeiculos();
                break;
            
            case 3:
                listarPessoas();
                break;

            case 4:
                listarCarros();
                break;
            
            default: 
                printf("opcao invalida");
        }
    } 
    while(opcao != 0);

}
