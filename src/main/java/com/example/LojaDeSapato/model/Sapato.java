package com.example.LojaDeSapato.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Sapato {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;
    private String modelo;
    private String cor;
    private int tamanho;
    private double preco;

    // Getters e Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getModelo() { return modelo; }
    public void setModelo(String modelo) { this.modelo = modelo; }

    public String getCor() { return cor; }
    public void setCor(String cor) { this.cor = cor; }

    public int getTamanho() { return tamanho; }
    public void setTamanho(int tamanho) { this.tamanho = tamanho; }

    public double getPreco() { return preco; }
    public void setPreco(double preco) { this.preco = preco; }
}
