import java.io.*;
import java.util.*;


public class changeName {

	//  menu principal
	private static void menu() { // menu principal
		int opcao = 0;
		do {
			System.out.println("\n\n### Bem-Vindo ao jogo de Damas!  ###");
			System.out.println("\n\n Quem vai começar a jogar primeiro? ");
			System.out.println("\n                |=======================|");
			System.out.println("                  |     1 - Jogador1      |");
			System.out.println("                  |     2 - Jogador2      |");
			System.out.println("                  |     0 - Sair          |");
			System.out.println("\n                |=======================|");


			opcao = Console.readInt("Opção -> ");
			System.out.print("\n");
			switch (opcao) {
				case 1:
					jogador1();
					break;

				case 2:
					jogador2();
					break;
				
				case 0:
					break;
				
				default:
					System.out.println("Opção Inválida!");
					break;
			}
		} while (opcao != 0);
	}

	public static void main(String [] args) {

		menu();

	}
}