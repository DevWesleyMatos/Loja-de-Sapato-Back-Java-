package com.example.LojaDeSapato.controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.LojaDeSapato.model.Sapato;
import com.example.LojaDeSapato.repository.SapatoRepository;
import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/sapatos")
public class SapatoController {

    @Autowired
    private SapatoRepository sapatoRepository;

    @GetMapping
    public List<Sapato> listar() {
        return sapatoRepository.findAll();
    }

    @PostMapping
    public Sapato adicionar(@RequestBody Sapato sapato) {
        return sapatoRepository.save(sapato);
    }

    @PutMapping("/{id}")
    public Sapato atualizar(@PathVariable Long id, @RequestBody Sapato sapato) {
        sapato.setId(id);
        return sapatoRepository.save(sapato);
    }

    @DeleteMapping("/{id}")
    public void deletar(@PathVariable Long id) {
        sapatoRepository.deleteById(id);
    }
}
