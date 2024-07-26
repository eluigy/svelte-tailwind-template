<script>
  export let year = new Date().getFullYear();
</script>

<div class="flex flex-col min-h-screen m-0">
  <header class="bg-gray-800 text-white h-16">
    <div class="container mx-auto flex justify-between items-center h-full">
      <div class="flex items-center">
        <img src="./favicon.png" alt="Logo de mi sitio" class="h-12 ml-1" />
        <h1 class="text-2xl font-bold ml-1">SBELTE TEMPLATE</h1>
      </div>

      <nav>
        <ul class="flex space-x-4">
          <li><a href="/" class="hover:text-gray-300">Inicio</a></li>
          <li><a href="/" class="hover:text-gray-300">Acerca de</a></li>
          <li><a href="/" class="hover:text-gray-300">Contacto</a></li>
        </ul>
      </nav>
    </div>
  </header>

  <main class="flex-grow">
    <slot />
  </main>

  <footer class="bg-gray-800 text-white">
    <div class="container mx-auto p-1 flex justify-between items-center">
      <div class="text-sm">
        &copy; {year} Mi Sitio Web. Todos los derechos reservados.
      </div>
    </div>
  </footer>
</div>
