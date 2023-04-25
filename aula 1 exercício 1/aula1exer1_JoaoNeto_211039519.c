#include <stdio.h>
#include <string.h>

struct Veiculo{
    int quantVeiculos;
    char placa[8];
    char cor[20];
    char marca[30];
    char modelo[30];
};

struct Pessoa{
    char nome[30];
    char CPF[12];    
};


void menu();
void cadastrarPessoas();
void cadastrarVeiculos();


int main(){

    int opcao1=0;
    int opcao2=0;
    
    while(opcao2 != 2){

        menu();

    
    
        cadastrarPessoas();
        

        printf("Deseja cadastrar veiculos? 1-SIM 2-NAO\n");
        scanf("%d", &opcao1);
        if(opcao1==1){
            cadastrarVeiculos();
        }else{
            return 0;
        }
        printf("Deseja cadastrar mais pessoas ou consultar? 1-SIM 2-NAO\n");
        scanf("%d", &opcao2);
    }


    return 0;
}

void menu(){

    printf("-----Bem vindo ao Gerenciador de Veículos-----\n");
    
}

void cadastrarPessoas(){

    FILE *cadastraPessoa;

    struct Pessoa pw; //Struct para escrita em arquivo.bin(pw = pessoa write)
    
        printf("Digite o nome da pessoa:\n");
        scanf("%s", pw.nome);
        printf("Digite o CPF:\n");
        scanf("%s", pw.CPF);

    

    cadastraPessoa = fopen("Pessoas.bin", "ab");

    fwrite(&pw, 1, sizeof(struct Pessoa), cadastraPessoa);
    fseek(cadastraPessoa, 1, SEEK_SET);
    fclose(cadastraPessoa);

}

void cadastrarVeiculos(){

    struct Veiculo vw[100]; //Struct para escrita em arquivo.bin(vw = Veiculo write)


    int cont=0;

    FILE *cadastraVeiculo;


    printf("Digite a quantidade de veiculos que deseja cadastrar:\n");
    scanf("%d", &cont);
    
    vw[cont].quantVeiculos = cont;
    
    
    cadastraVeiculo = fopen("Veiculos.bin", "ab");
    
    for(int i = 1; i<=vw[cont].quantVeiculos; i++){
        printf("Digite a marca do veículo %d:\n", i);
        scanf("%s", vw[i].marca);
        printf("Digite o modelo do veículo %d:\n", i);
        scanf("%s", vw[i].modelo);
        printf("Digite a placa do veículo %d:\n", i);
        scanf("%s", vw[i].placa);
        printf("Digite a cor do veículo %d:\n", i);
        scanf("%s", vw[i].cor);


        fwrite(&vw[i], 1, sizeof(struct Veiculo), cadastraVeiculo);
        fseek(cadastraVeiculo, 1, SEEK_SET);
    }
    
        fclose(cadastraVeiculo);




    struct Pessoa pr; //pr = pessoa read
    struct Pessoa cp; //cp = consult pessoa



    FILE *cadastraPessoa;
    FILE *pesquisaVeiculo;

    cadastraPessoa = fopen("Pessoas.bin", "rb");
    pesquisaVeiculo = fopen("Veiculos.bin", "rb");


    printf("Informe a pessoa que deseja procurar:\n");
    scanf("%s", cp.nome);
    
     while(fread(&pr, sizeof(struct Pessoa), 1, cadastraPessoa)){
        while(fread(&vw, sizeof(struct Veiculo), 1, pesquisaVeiculo)){
            if(strcmp(cp.nome, pr.nome) == 0){
                for(int i = 1; i<=cont; i++){
                    printf("\nNOME: %s\nCPF: %s\nVeiculo: %s %s\nPlaca: %s\nCor: %s\n", pr.nome, pr.CPF, vw[i].marca, vw[i].modelo, vw[i].placa, vw[i].cor);
                }
            }
            break;
        }
    }

    fclose(cadastraPessoa);
    fclose(pesquisaVeiculo);


}
