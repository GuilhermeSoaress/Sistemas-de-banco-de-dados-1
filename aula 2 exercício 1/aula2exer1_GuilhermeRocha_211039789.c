#include <stdio.h>
#include <string.h>

struct Carro{
    int quantVeiculos;
    char placa[8];
    char ano[20];
    char marca[30];
    char modelo[30];
};

struct Pessoa{
    char nome[30];
    char CPF[12]; 
    int id;  
};

void cadastrarPessoas(){

    FILE *cadastraPessoa;

    struct Pessoa pessoa;
    
        printf("Digite o nome da pessoa:\n");
        scanf("%s", pessoa.nome);
        printf("Digite o CPF:\n");
        scanf("%s", pessoa.CPF);

    cadastraPessoa = fopen("pessoas.bin", "ab");

    fwrite(&pessoa, 1, sizeof(struct Pessoa), cadastraPessoa);
    fseek(cadastraPessoa, 1, SEEK_SET);
    fclose(cadastraPessoa);
    pessoa.id++;
}

void cadastrarVeiculos(){

    struct Carro Carro[100]; 

    int cont=0;

    FILE *cadastraVeiculo;

    printf("Digite a quantidade de veiculos que deseja cadastrar:\n");
    scanf("%d", &cont);
    
    Carro[cont].quantVeiculos = cont;
    
    cadastraVeiculo = fopen("carros.bin", "ab");
    
    for(int i = 1; i<=Carro[cont].quantVeiculos; i++){
        printf("Digite a marca do veículo %d:\n", i);
        scanf("%s", Carro[i].marca);
        printf("Digite o modelo do veículo %d:\n", i);
        scanf("%s", Carro[i].modelo);
        printf("Digite a placa do veículo %d:\n", i);
        scanf("%s", Carro[i].placa);
        printf("Digite a ano do veículo %d:\n", i);
        scanf("%s", Carro[i].ano);

        fwrite(&Carro[i], 1, sizeof(struct Carro), cadastraVeiculo);
        fseek(cadastraVeiculo, 1, SEEK_SET);
    }
    
        fclose(cadastraVeiculo);

    struct Pessoa lerPessoa; 
    struct Pessoa consultaPessoa; 

    FILE *cadastraPessoa;
    FILE *pesquisaVeiculo;

    cadastraPessoa = fopen("pessoas.bin", "rb");
    pesquisaVeiculo = fopen("carros.bin", "rb");


    printf("Informe a pessoa que deseja procurar:\n");
    scanf("%s", consultaPessoa.nome);
    
     while(fread(&lerPessoa, sizeof(struct Pessoa), 1, cadastraPessoa)){
        while(fread(&Carro, sizeof(struct Carro), 1, pesquisaVeiculo)){
            if(strcmp(consultaPessoa.nome, lerPessoa.nome) == 0){
                for(int i = 1; i<=cont; i++){
                    printf("\nNOME: %s\nCPF: %s\nVeiculo: %s %s\nPlaca: %s\nAno: %s\n", lerPessoa.nome, lerPessoa.CPF, Carro[i].marca, Carro[i].modelo, Carro[i].placa, Carro[i].ano);
                }
            }
            break;
        }
    }

    fclose(cadastraPessoa);
    fclose(pesquisaVeiculo);
}

int main(){
    int opcao;
    printf("---Cadastro de veículos---\n");

    do{
        printf("Escolher opcao:\n1 -> cadastrar pessoa\n2 -> cadastrar carros\n0 -> sair\n");
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
            
            default: 
                printf("opcao invalida");
        }
    } 
    while(opcao != 0);

}