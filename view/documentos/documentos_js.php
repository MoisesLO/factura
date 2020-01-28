<script>
    var app = new Vue({
        el: '#app',
        data: {
            nombre: 'moises',            
            factura: {
                id: '',
                ruc: '',
                razon: '',
                direccion: '',
                serie: '',
                fecha_emision: '',
                venta_interna: '',
                items: [
                    {
                        nombre: '',                        
                        unidad: '',
                        cantidad: 0,
                        precio_con_igv: 0,
                        precio_sin_igv: 0,
                        igv: 0,
                        tipo_igv: '0',
                        descuento: 0,
                        subtotal: 0,
                        total: 0
                    }
                ]
            },
            boleta: {
                id: ''
            },
            nota: {
                id: ''
            },
            debito: {
                id: ''
            }
        },
        methods: {
            facturaItemCantidadChange: function(item){
                console.log(item)
            },
            facturaItemPrecioChange: function(item){
                console.log(item)
            },
            facturaItemTotalChange: function(item){
                console.log(item)
            },
            facturaOpenModal: function(action) {
                if (action == 'nuevo'){
                    this.factura.id = '';                    
                }else if (action == 'editar'){  

                }                
                $('#facturaModal').modal('show')
            },
            facturaAddLine: function(){
                this.factura.items.push({
                    nombre: '',                    
                    unidad: '',
                    cantidad: 0,
                    precio_con_igv: 0,
                    precio_sin_igv: 0,
                    tipo_igv: '0',
                    igv: 0,
                    descuento: 0,
                    subtotal: 0,
                    total: 0
                });
            },
            boletaOpenModal: function(action) {
                if (action == 'nuevo'){
                    this.boleta.id = '';                    
                }else if (action == 'editar'){  
                                      
                }
                $('#boletaModal').modal('show')
            },
            creditoOpenModal: function(action) {
                if (action == 'nuevo'){
                    this.credito.id = '';                    
                }else if (action == 'editar'){  
                                      
                }
                $('#creditoModal').modal('show')
            },
            debitoOpenModal: function(action) {
                if (action == 'nuevo'){
                    this.debito.id = '';                    
                }else if (action == 'editar'){  
                                      
                }
                $('#debitoModal').modal('show')
            }
        }
    });
</script>